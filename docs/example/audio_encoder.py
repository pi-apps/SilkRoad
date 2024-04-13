# Initialize the audio encoder
encoder = AudioEncoder(sample_rate=48000, bitrate=128000)

# Encode a single audio frame
frame = cv2.imread("input.wav", cv2.IMREAD_UNCHANGED)
encoder.encode_frame(frame)

# Release the audio encoder
encoder.release()
