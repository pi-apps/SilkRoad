import asyncio
import os
from typing import Optional

import aiohttp
import aiortc


class VideoCall:

    def __init__(self, session: aiohttp.ClientSession, room_name: str,
                 user_id: str):
        self.session = session
        self.room_name = room_name
        self.user_id = user_id
        self.pc = None

    async def create_offer(self) -> str:
        # Create a new RTCPeerConnection
        self.pc = aiortc.RTCPeerConnection()

        # Add a local audio and video track
        self.pc.addTrack(aiortc.AudioStreamTrack())
        self.pc.addTrack(aiortc.VideoStreamTrack())

        # Create an offer
        offer = await self.pc.createOffer()
        await self.pc.setLocalDescription(offer)

        # Return the offer as a string
        return offer.sdp

    async def set_remote_description(self, sdp: str):
        # Set the remote description
        await self.pc.setRemoteDescription(
            aiortc.RTCSessionDescription(sdp=sdp, type="offer"))

    async def add_ice_candidate(self, candidate: aiortc.RTCIceCandidate):
        # Add an ICE candidate
        await self.pc.addIceCandidate(candidate)

    async def close(self):
        # Close the RTCPeerConnection
        await self.pc.close()


async def main():
    # Create an aiohttp ClientSession
    async with aiohttp.ClientSession() as session:
        # Create a new VideoCall instance
        video_call = VideoCall(session, "my-room", "user1")

        # Create an offer
        offer_sdp = await video_call.create_offer()

        # Print the offer
        print("Offer:")
        print(offer_sdp)

        # Set the remote description
        remote_sdp = input("Enter remote SDP: ")
        await video_call.set_remote_description(remote_sdp)

        # Add ICE candidates
        while True:
            candidate = input("Enter ICE candidate (or 'done' to finish): ")
            if candidate == "done":
                break
            await video_call.add_ice_candidate(
                aiortc.RTCIceCandidate(candidate))

        # Close the VideoCall
        await video_call.close()


if __name__ == "__main__":
    asyncio.run(main())
