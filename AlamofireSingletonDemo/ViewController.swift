//
//  ViewController.swift
//  AlamofireSingletonDemo
//
//  Created by Abhi's Mac on 29/01/18.
//  Copyright © 2018 Abhi's Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.json()
        self.stringAny()
        
    }
    func json(){
        
        WebService.sharedInstance.requestGETURL("https://api.androidhive.info/contacts/", success: { (json) in
            print(json)
            
        }) { (error) in
            print(error)
        }
    }
    func stringAny(){
        WebService.sharedInstance.requestGETURL2("https://api.androidhive.info/contacts/", success: { (response) in
            print(response)
        }) { (error) in
            print(error)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

