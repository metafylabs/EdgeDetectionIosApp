//
//  ViewController.swift
//  IosTestapp
//
//  Created by Treinetic on 2023-02-17.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func scan_document_btn(_ sender: Any) {
        print("call----->>>>>")
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ScanDocumentView") as! ScanDocumentController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}

