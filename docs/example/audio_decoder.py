# Initialize the audio decoder
decoder = AudioDecoder(sample_rate=48000)

# Decode a single audio frame
ret, frame = decoder.decode_frame()

# Process the decoded frame
# ...

# Release the audio decoder
decoder.release()
