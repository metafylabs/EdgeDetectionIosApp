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
    
    let settings = [
        "token" : "1234",
        "backgroundColor":0x20262E,
        "buttonColor":0xE9E8E8,
        "progressIndicatorColor":0xE9E8E8,
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
     handleFlutteModule()
    }


    @objc func handleFlutteModule() {
        let PLATFORM = "com.example.metafy_edge_detection_module"
        let SEND_SETTINGS_CHANNEL = "sendSettings"
        let GET_IMAGE_CHANNEL = "getImageUrl"
        let CALL_FLUTTER_VIEW_CHANNEL="callFlutterView"
 
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
                 self.present(flutterViewController, animated: true, completion: nil)
             }
             // get image url
             if(call.method==GET_IMAGE_CHANNEL){
                 let args = call.arguments as? Dictionary<String,Any>

                 let url = args?["url"] as! String
                 print("arguments from dart side ------->>>>>>>>> ",url)
                // dismiss the flutterview
                 self.dismiss(animated: true, completion: nil)
                 //dismiss the scandocumentController view
                 self.dismiss(animated: true, completion: nil)
             }

         })
        
        }
        
     }
}
