//
//  ScanDocumentController.swift
//  IosTestapp
//
//  Created by Treinetic on 2023-02-17.
//

import UIKit
import Flutter
import Foundation
import FlutterPluginRegistrant

class ScanDocumentController: UIViewController{
    
   var window: UIWindow?
    var flutterEngine : FlutterEngine?
    var isInit = false;
    
    // put your token and background colors as a Value.
    // DON'T CHANGE THE KEYS

    let settings = [
        "token" : "1234",
        "backgroundColor":0x20262E,
        "buttonColor":0xE9E8E8,
        "progressIndicatorColor":0xE9E8E8,
        "cropperActiveIconColor" : 0xFFA500,
        "cropperTitle" : "Image Cropper",
    ] as [String : Any]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if(!isInit){
            // initiate the flutter engine
            self.flutterEngine = FlutterEngine(name: "io.flutter", project: nil)
            //start flutter engine
            self.flutterEngine?.run(withEntrypoint: nil)
            GeneratedPluginRegistrant.register(with: self.flutterEngine!)
            isInit = true
        }
      
    }
    
  
    override func viewWillAppear(_ animated: Bool) {
     //start communicate between flutter and ios
       getDocumentUrl()
    }


    
    
    @objc func getDocumentUrl() {
        // DON'T CHANGE THIS
        let PLATFORM = "com.example.metafy_edge_detection_module"
        let SEND_SETTINGS_CHANNEL = "sendSettings"
        let GET_IMAGE_CHANNEL = "getImageUrl"
        let CALL_FLUTTER_VIEW_CHANNEL="callFlutterView"
        
        var url:String="";
 
     if let flutterEngine = flutterEngine{
            let channel = FlutterMethodChannel(name: PLATFORM, binaryMessenger: flutterEngine.binaryMessenger)
         
         channel.setMethodCallHandler({
             (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
             // send settings to the flutter
             if(call.method==SEND_SETTINGS_CHANNEL){
                 result(self.settings)
       
             }
             //start flutter view
             if(call.method==CALL_FLUTTER_VIEW_CHANNEL){
                 let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
                 flutterViewController.modalPresentationStyle = .fullScreen
                 self.present(flutterViewController, animated: true, completion: nil)
             }
             // get image url
             if(call.method==GET_IMAGE_CHANNEL){
                 let args = call.arguments as? Dictionary<String,Any>

                 // DON'T CHANGE THE KEY
                  url = args?["url"] as! String
                 print("Document Url---->>> ",url)
                // dismiss the flutterview
                 self.dismiss(animated: true, completion: nil)
                 //dismiss the scandocumentController view
                 self.dismiss(animated: true, completion: nil)
             }

         })
        
        }
     
     }
    
}
