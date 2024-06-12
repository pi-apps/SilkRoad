import asyncio
import json
import os
import sys
import threading
import time
from typing import Optional

import aiohttp
import agora

class VideoAPI:
    def __init__(self, app_id: str, app_certificate: str, channel_name: str, user_id: str):
        self.app_id = app_id
        self.app_certificate = app_certificate
        self.channel_name = channel_name
        self.user_id = user_id
        self.client = None
        self.local_stream = None
        self.remote_streams = set()
        self.chat_messages = []

    async def create_client(self):
        # Create a new Agora Video SDK client
        self.client = agora.Client(self.app_id, self.app_certificate)

        # Set the channel profile to "live_broadcasting"
        self.client.set_channel_profile("live_broadcasting")

        # Set the client role to "host"
        self.client.set_client_role("host")

        # Set the channel name
        self.client.set_channel_name(self.channel_name)

        # Set the user ID
        self.client.set_user_id(self.user_id)

        # Set the video encoder configuration
        self.client.set_video_encoder_configuration({
            "width": 1280,
            "height": 720,
            "frame_rate": 30,
            "bitrate": 2048000
        })

        # Set the audio encoder configuration
        self.client.set_audio_encoder_configuration({
            "bitrate": 128000,
            "sample_rate": 48000,
            "number_of_channels": 2
        })

        # Set the event handler
        self.client.on("stream-added", self._on_stream_added)
        self.client.on("stream-removed", self._on_stream_removed)
        self.client.on("stream-subscribed", self._on_stream_subscribed)
        self.client.on("stream-unsubscribed", self._on_stream_unsubscribed)
        self.client.on("message-from-peer", self._on_message_from_peer)

        # Start the client
        await self.client.start()

    async def create_local_stream(self):
        # Create a new local video stream
        self.local_stream = await self.client.create_local_stream()

        # Add a video track to the local stream
        video_track = await self.local_stream.add_video_track("video")
        video_track.set_enabled(True)

        # Add an audio track to the local stream
        audio_track = await self.local_stream.add_audio_track("audio")
        audio_track.set_enabled(True)

        # Publish the local stream to the channel
        await self.client.publish(self.local_stream)

    async def unpublish_local_stream(self):
        # Unpublish the local stream from the channel
        await self.client.unpublish(self.local_stream)

    async def subscribe_remote_stream(self, stream_uid: str):
        # Subscribe to a remote video stream
        remote_stream = await self.client.subscribe(stream_uid)

        # Add the remote stream to the list of remote streams
        self.remote_streams.add(remote_stream)

    async def unsubscribe_remote_stream(self, stream_uid: str):
        # Unsubscribe from a remote video stream
        remote_stream = None
        for stream in self.remote_streams:
            if stream.uid == stream_uid:
                remote_stream = stream
                break
        if remote_stream is not None:
            await self.client.unsubscribe(remote_stream)
            self.remote_streams.discard(remote_stream)

    async def send_chat_message(self, message: str):
        # Send a chat message
        self.chat_messages.append({"sender_id": self.user_id, "message": message})

        # Send the chat message to all peers in the channel
        for remote_stream in self.remote_streams:
            await remote_stream.send_message(message.encode("utf-8"))

    async def receive_chat_message(self, message: bytes):
        # Receive a chat message
        message_str = message.decode("utf-8")
        self.chat_messages.append({"sender_id": "peer", "message": message_str})

    async def _on_stream_added(self, stream: agora.Stream):
        # Handle a new stream being added to the channel
        print("New stream added:", stream.uid)

        # Subscribe to the remote stream
        await self.subscribe_remote_stream(stream.uid)

    async def _on_stream_removed(self, stream: agora.Stream):
        # Handle a stream being removed from the channel
        print("Stream removed:", stream.uid)

        # Unsubscribe from the remote stream
        await self.unsubscribe_remote_stream(stream.uid)

    async def _on_stream_subscribed(self, stream: agora.Stream):
        # Handle a remote stream being successfully subscribed
        print("Stream subscribed:", stream.uid)

    async def _on_stream_unsubscribed(self, stream: agora.Stream):
        # Handle a remote stream being unsubscribed
        print("Stream unsubscribed:", stream.uid)

    async def _on_message_from_peer(self, uid: str, message: bytes):
        # Handle a message from a peer in the channel
        print("Message from peer:", uid, message)

        # Receive the chat message
        await self.receive_chat_message(message)

async def video_api_app(request):
    if request.method == "GET":
        # Get the current state of the video API
        return sanic.response.json({"chat_messages": video_api.chat_messages})
    elif request.method == "POST":
        # Send a chat message
        data = json.loads(request.body)
        message = data["message"]
        await video_api.send_chat_message(message)
        return sanic.response.json({"success": True})

if __name__ == "__main__":
    app = sanic.Sanic()

    video_api = VideoAPI(
        os.environ["AGORA_APP_ID"],  # Replace this with your Agora App ID
        os.environ["AGORA_APP_CERTIFICATE"],  # Replace this with your Agora App Certificate
        "my-channel",  # Replace this with your channel name
        "user1"  # Replace this with your user ID
    )

    # Create the Agora Video SDK client
    asyncio.ensure_future(video_api.create_client())

    # Create the local video stream
    asyncio.ensure_future(video_api.create_local_stream())

    # Start the video API server
    app.add_route(video_api_app, "/api/video-api", methods=["GET", "POST"])
    app.run(host="0.0.0.0", port=8000)

    # Close the Agora Video SDK client
    await video_api.client.leave()
    await video_api.client.destroy()
