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
    @IBOutlet weak private var apiResponseLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        request()
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

    func request() {
        let url = "https://jsonplaceholder.typicode.com/posts/"
        let httpRequest = try! HTTPRequest(method: .Get,
                                          url: url)

        HTTPRequester.execute(httpRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                self.showAlert(message: error.localizedDescription)
            } else {
                let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                let code = (response as! HTTPURLResponse).statusCode

                self.apiResponseLabel.text = "Code:\(code), Response string: \(String(describing: responseString))"
            }
        }
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "ERROR", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .destructive)
        alert.addAction(action)

        present(alert, animated: true)
    }
}

