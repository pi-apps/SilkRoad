# Initialize the video encoder
encoder = VideoEncoder(width=1280, height=720, fps=30, bitrate=2048000)

# Encode a single video frame
frame = cv2.imread("input.jpg")
encoder.encode_frame(frame)

# Release the video encoder
encoder.release()
