## Implement the Ios App

## 1) Import the Metafy Edge Detection Ios Framework to your Ios project

## i) Extract the downloaded Zip file in your root of the project.

## ii) Go to the "Frameworks,Libraries,and Embedded Content" in "General" and Drag and drop you downloaded frameworks to it.

## iii) Do not embed the "FlutterPluginRegistrant.xcframework" and "permission_handler_apple.xcframework" to your project and others must embed as a "Embed & Sign"

image

## 2) For implement this you need the two view controllers in first one Request the Camera permission and After Granted the permission Navigate to the Second viewController.

## i) In info.plist need to add this

        <key>NSCameraUsageDescription</key>
       <string>Allow access to camera</string>

## 3) For the Second viewController you can refer the example code in "ScanDocumentController"
