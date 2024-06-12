// object_detection.cpp
#include <opencv2/opencv.hpp>
#include <dlib/dlib.hpp>

using namespace cv;
using namespace dlib;

class ObjectDetector {
public:
    ObjectDetector(String model_path) {
        net = dnn::readNetFromDarknet(model_path, "yolov4.cfg");
    }

    void detect(Mat frame) {
        Mat blob;
        dnn::blobFromImage(frame, blob, 1/255.0, Size(416, 416), Scalar(0,0,0), true, false);
        net.setInput(blob);
        vector<Mat> outs;
        net.forward(outs);

        for (size_t i = 0; i < outs.size(); ++i) {
            float* data = (float*)outs[i].data;
            for (int j = 0; j < outs[i].rows; ++j, data += outs[i].cols) {
                Mat scores = outs[i].row(j).colRange(5, outs[i].cols);
                Point classIdPoint;
                double confidence;
                minMaxLoc(scores, 0, &confidence, 0, &classIdPoint);
                if (confidence > 0.5) {
                    int centerX = (int)(data[0] * frame.cols);
                    int centerY = (int)(data[1] * frame.rows);
                    int width = (int)(data[2] * frame.cols);
                    int height = (int)(data[3] * frame.rows);
                    rectangle(frame, Point(centerX, centerY), Point(centerX + width, centerY + height), Scalar(0, 255, 0), 2);
                }
            }
        }
    }

private:
    Net net;
};

int main() {
    ObjectDetector detector("yolov4.weights");
    VideoCapture cap(0);
    while (true) {
        Mat frame;
        cap >> frame;
        detector.detect(frame);
        imshow("Object Detection", frame);
        waitKey(1);
    }
    return 0;
}
