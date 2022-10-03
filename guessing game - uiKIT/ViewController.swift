//
//  ViewController.swift
//  guessing game - uiKIT
//
//  Created by Eric Nguyen on 10/2/22.
//

/// what are instance properties?
/// how to write these vars + implement them
/// "get set"??

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    let status: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        label.textAlignment = .center
        label.text = "bobobobbobo"
        
        // billy bob joe
                   
        return label
    }()
    let textBox: UITextField = {
        let txt = UITextField(frame: CGRect(x: 160, y: 185, width: 200, height: 30))
        txt.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        txt.textAlignment = .center
        txt.text = "Hello, you can enter something here."
        
        return txt
    }()
    /// super = calls parent object UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.init(red: 1, green: 0, blue: 1, alpha: 1)
        self.view.addSubview(status)
        self.view.addSubview(textBox)
        self.status.text = "ahahahahahahahahaahahhahahhahahahahahahahhahahah"
        textBox.delegate = self
        
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        print(textBox.text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}

