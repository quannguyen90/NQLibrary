//
//  ViewController.swift
//  NQLibrary
//
//  Created by Quan Nguyen Van on 11/27/2015.
//  Copyright (c) 2015 Quan Nguyen Van. All rights reserved.
//

import UIKit
import NQLibrary

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://raw.githubusercontent.com/CocoaPods/Specs/a828e815ac7b13b5fdffeac92657ccb8f235a78b/Specs/Demo/0.1.0/Demo.podspec.json"
        NQHTTPRequest.sharedInstance.addAcceptContentType("text/plain")
        NQHTTPRequest.sharedInstance.GETRequest(url, headerRequest: ["Content-Type":"application/json"], urlParam: [String:String](), success: { (responseObject) -> () in
            print("---->>\(responseObject)")
            }) { (error) -> () in
                print("---->>\(error.localizedDescription)")
                
        }

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

