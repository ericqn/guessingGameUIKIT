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

    // something about UITextView allows multiple lines to be implemented
    let status: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 21))
        label.center = CGPoint(x: 200, y: 285)
        label.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        label.text = ""
                   
        return label
    }()
    
    let guess = ""
    
    // all this extra complicated stuff has made it nearly impossible
    // to implement things into the program
    // things aren't intuitive anymore and I can't really use existing
    // knowledge to bring things into the game
    
//    let secret: Int
//    let upperLimit: Int
//    let lowerLimit: Int
//
//    init(secret: Int, upperLimit: Int, lowerLimit: Int) {
//        super.init(
//        self.secret = secret
//        self.upperLimit = upperLimit
//        self.lowerLimit = lowerLimit
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    let guessBox: UITextField = {
        let txt = UITextField(frame: CGRect(x: 0, y: 0, width: 350, height: 30))
        txt.center = CGPoint(x: 200, y: 400)
        txt.font = .boldSystemFont(ofSize: 30)
        txt.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        txt.textAlignment = .center
        txt.text = "You can enter your guess here."
        
        return txt
    }()
    /// super = calls parent object UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        self.view.addSubview(status)
        self.view.addSubview(guessBox)
        self.status.text = "Guess a number from 0 to 10."
        guessBox.delegate = self
        
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        print(guessBox.text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
        return true
    }
}

