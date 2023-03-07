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
       
    }

    @IBAction func scan_document_btn(_ sender: Any) {
        
        //  Already Authorized
        if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) ==  AVAuthorizationStatus.authorized
        {
            // Call the navigate function for navigate to the second vietrollerwCon in here scond vietrollerwCon name is "ScanDocumentController"
           self.navigate()
        }
        else
        {
            //Request the permission
            AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (granted :Bool) -> Void in
              if granted == true
              {
                  // call the navigate function
              self.navigate()
              }
              else
              {
                 // Reject the camera permission
              }
           });
        }
    }
    
    func navigate(){
        DispatchQueue.main.async {
          let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
          let vc = storyBoard.instantiateViewController(withIdentifier: "ScanDocumentView") as! ScanDocumentController
              vc.modalPresentationStyle = .fullScreen
              self.present(vc, animated: true, completion: nil)
        }
    }
}

