# Initialize the video decoder
decoder = VideoDecoder(width=1280, height=720, fps=30)

# Decode a single video frame
ret, frame = decoder.decode_frame()

# Process the decoded frame
# ...

# Release the video decoder
decoder.release()
