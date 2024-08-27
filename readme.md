
# AttendEaze

AttendEaze aims to remove the hassle of taking attendance of any kind manually, leveraging QR codes, it automates the task.


## Features
* Cross-platform, works on both Android and Ios.
* Highly intuitive UI design for ease of use.
* Google Auth & sync with google accounts.
* Two-phase support (one can commence a event and also attend other events)
* Attendance data can be uploaded to google drive automatically in csv format
* Safer than conventional methods of taking attendance.
* Supports batch scanning for cases when single scanner is present to mark attendance.

## Tech Used
* **Flutter** Framework is used for frontend, allowing it to compile it for multiple-platforms.
* **Flask** is used for declaring REST APIs, in backend.
* **PostgresSQL** is used for database system.
* Used device-native camera API to scan QR codes.
* **Google APIs** to authenticate every user, as well as to upload data to google drive.
