//
//  ViewController.swift
//  SampleApp
//
//  Created by Alex Bartis on 05/05/2017.
//  Copyright © 2017 Alex Bartis. All rights reserved.
//

import UIKit
import BartisUtilities

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func setBackgroundColor() {
        self.view.backgroundColor = UIColor(hexString: "d48872")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

