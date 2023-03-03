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
        if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) ==  AVAuthorizationStatus.authorized
        {
           self.navigate()
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
                  print("User Rejected----->>>>>")
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

