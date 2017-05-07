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

    @IBOutlet weak private var truncateLenghtLabel: UITextField!
    @IBOutlet weak private var truncatedTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //UIColor-Extension
    @IBAction func setBackgroundColor() {
        self.view.backgroundColor = UIColor(hexString: "d48872")
    }

    //String-Extension
    @IBAction func truncateText() {
        let text = truncatedTextView.text
        let truncatedLenght = Int(truncateLenghtLabel.text!) ?? 1

        truncatedTextView.text = text?.trunc(length: truncatedLenght)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

