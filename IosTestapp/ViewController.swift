//
//  ViewController.swift
//  IosTestapp
//
//  Created by Treinetic on 2023-02-17.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func scan_document_btn(_ sender: Any) {
        print("call----->>>>>")
        
        
        if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) ==  AVAuthorizationStatus.authorized
        {
        
            print("Already Authorized----->>>>>")
            self.navigate()
            
           // Already Authorized
            
        }
        else
        {
            AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (granted :Bool) -> Void in
              if granted == true
              {
                  self.navigate()
                  
              }
              else
              {
                 // User Rejected
                  print("User Rejected----->>>>>")
           
              }
           });
        }
        
        
      
 
    }
    
    func navigate(){
        DispatchQueue.main.async {
            print("Already Authorized----->>>>>")
          let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
          let vc = storyBoard.instantiateViewController(withIdentifier: "ScanDocumentView") as! ScanDocumentController
              vc.modalPresentationStyle = .fullScreen
              self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    
}

