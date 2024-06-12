import cv2
import numpy as np

# Load the pre-trained quality control model
model = cv2.dnn.readNetFromCaffe(
    "deploy.prototxt", "res10_300x300_ssd_iter_140000_fp16.caffemodel")


# Define a function to analyze product images
def analyze_product_image(image_path):
    # Load the image
    image = cv2.imread(image_path)

    # Preprocess the image
    image = cv2.resize(image, (300, 300))
    image = image.astype(np.float32)
    image = np.expand_dims(image, axis=0)
    image = image / 255.0

    # Analyze the image using the pre-trained model
    scores, boxes = model.forward(["detection_out", "detection_scores"])

    # Postprocess the results
    for i in range(scores.shape[2]):
        score = scores[0, i, 1]
        if score > 0.5:
            box = boxes[0, i, 3:7] * np.array([
                image.shape[1], image.shape[0], image.shape[1], image.shape[0]
            ])
            (x, y, w, h) = box.astype("int")
            label = "Quality Issue"
            color = (0, 0, 255)
            cv2.rectangle(image, (x, y), (x + w, y + h), color, 2)
            cv2.putText(image, label, (x, y - 10), cv2.FONT_HERSHEY_SIMPLEX,
                        0.5, color, 2)

    # Display the results
    cv2.imshow("Product Image", image)
    cv2.waitKey(0)
    cv2.destroyAllWindows()


# Test the analyze_product_image function
image_path = "product_image.jpg"
analyze_product_image(image_path)
