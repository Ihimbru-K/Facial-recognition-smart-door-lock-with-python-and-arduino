# Smart-door-lock-using-python-OpenCV-tensorflow-arduino
This was implemented using openCV and arduino. 
Communication between arduino and python source codes is established via serial communication with the use of pyserial library.
The python part of the project is divided into 6 modules : collecting data, Reading images from webcam, facial detection, model training and facial recognition.
Each module has it's corresponding input and output.
Each data set of the trained images is assigned an ID.
It is the required ID and confidence score of images read by the webcam that triggers the arduino to start working.
The arduino hardware module was implemented using a servomotor, potentiometer and arduino uno.
If the required ID from the python module is detected. The python code sends the string representation of that id to arduino.
In the arduino, if the required string is received from the required serial port, it causes the servomotor to move 360 degrees else it doesn't move.It starts by importing the Servo library.........
