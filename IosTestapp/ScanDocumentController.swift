//
//  ScanDocumentController.swift
//  IosTestapp
//
//  Created by Treinetic on 2023-02-17.
//

import UIKit
import Flutter
import Foundation

class ScanDocumentController: UIViewController, FlutterAppLifeCycleProvider {
    
    private let lifecycleDelegate = FlutterPluginAppLifeCycleDelegate()
    
    let flutterEngine = FlutterEngine(name: "flutter_nps_engine")
    
    let settings = [
        "token" : "1234",
        "backgroundColor":0x20262E,
        "buttonColor":0xE9E8E8,
        "progressIndicatorColor":0xE9E8E8,
    ] as [String : Any]
    override func viewDidLoad() {
        super.viewDidLoad()
        flutterEngine.run()
        handleFlutteModule()
      
    }
    
    func add(_ delegate: FlutterApplicationLifeCycleDelegate) {
        lifecycleDelegate.add(delegate)
    }
    


    @objc func handleFlutteModule() {
        let PLATFORM = "com.example.metafy_edge_detection_module";
        let SEND_SETTINGS_CHANNEL = "sendSettings";
        let GET_IMAGE_CHANNEL = "getImageUrl";
        
       let flutterViewController =
           FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)


        let channel = FlutterMethodChannel(name: PLATFORM, binaryMessenger: flutterViewController.binaryMessenger)


        channel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            if(call.method==SEND_SETTINGS_CHANNEL){
                result(self.settings)

            }
            if(call.method==GET_IMAGE_CHANNEL){
                let args = call.arguments as? Dictionary<String,Any>
             
                let url = args?["url"] as! String
                print("arguments from dart side ------->>>>>>>>> ",url)
                
                if let nav = self.navigationController {
                         nav.popViewController(animated: true)
                     } else {
                         self.dismiss(animated: true, completion: nil)
                
                     }
            }

        })
     }

}
