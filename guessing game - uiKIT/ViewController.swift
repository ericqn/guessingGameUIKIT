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
    
    let MARGIN:CGFloat = 10
    
    // something about UITextView allows multiple lines to be implemented
    // -> that's true: UITextView allows many lines
    // and UILabel also allows multiple lines
    // what prevents our seeing multiple lines because we limit the height to only 21
    // viewDidLayoutSubviews function resizes and places most things dynamically below
    let status: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 21))
        label.center = CGPoint(x: 200, y: 285)
        label.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        label.text = ""
        label.numberOfLines = 0 // this is the default value. 0 means the label can have as many lines that it needs
                   
        return label
    }()
    
    let guessBox: UITextField = {
        let txt = UITextField(frame: CGRect(x: 0, y: 0, width: 350, height: 30))
        txt.center = CGPoint(x: 200, y: 400)
        txt.font = .boldSystemFont(ofSize: 30)
        txt.textColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        txt.textAlignment = .center
        txt.placeholder = "You can enter your guess here."
        
        // there are other styling we can do with this text input field
        txt.borderStyle = .roundedRect
        txt.textColor = .black
        txt.layer.borderWidth = 1
        txt.layer.cornerRadius = 4.0
        txt.keyboardType = .numberPad
        
        return txt
    }()
    
    var guess = ""
    
    // all this extra complicated stuff has made it nearly impossible
    // to implement things into the program
    // things aren't intuitive anymore and I can't really use existing
    // knowledge to bring things into the game
    // -> I'd advise patience. There's a learning curve to everything, especially to a more complicated but powerful framework like UIKit
    
    var secret: Int
    var upperLimit: Int
    var lowerLimit: Int

    // -> with this custom initializer, we can inject values into the view controller
    init(secret: Int, upperLimit: Int, lowerLimit: Int) {
        self.secret = secret
        self.upperLimit = upperLimit
        self.lowerLimit = lowerLimit
        super.init(nibName: nil, bundle: nil) // -> this was what missing
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// super = calls parent object UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        self.view.addSubview(status)
        self.view.addSubview(guessBox)
        self.status.text = "Guess a number from \(lowerLimit) to \(upperLimit)."
        self.guessBox.delegate = self
    }
    
    // laying UI components out dynamically
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let width = self.view.frame.width
        let contentWidth = width - MARGIN*2
        
        let height = self.heightOf(text: self.status.text ?? "", width: contentWidth, font: self.status.font)
        
        let initialY = MARGIN*4
        status.frame = CGRect(x: 0, y: initialY, width: contentWidth, height: height)
        status.center = CGPoint(x: width/2, y: height/2 + initialY)
        
        var frame = status.frame
        frame.origin.y += status.frame.height + MARGIN
        frame.size.height = guessBox.frame.height
        guessBox.frame = frame
    }
    
    // calculating the required height
    func heightOf(text: String, width: CGFloat, font: UIFont) -> CGFloat {
        let constraintSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = text.boundingRect(with: constraintSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.height)
    }
    
    
    // MARK: - UITextFieldDelegate methods

    func textFieldDidBeginEditing(_ textField: UITextField) {
        // clear the guess box when the user starts typing in the text field
        textField.text = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // textField.text now contains the newly typed in string
        // What can you do here? Remember that we can assign new text values to self.status like this line
        // self.status.text = "I just got something"
        
        // print: log things in the console of Xcode
        print(textField.text ?? "")
        
//        self.status.text = "Your guess is \(textField.text ?? "")"
        
        // change content of status here
        
        self.view.setNeedsLayout()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // allows only numeric input
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
        return (string.rangeOfCharacter(from: invalidCharacters) == nil)
    }
}

