//
//  ViewController.swift
//  reverse
//
//  Created by Oleksandr Melnyk on 04.07.2022.
//

import UIKit

final class ReverseWordsViewController: UIViewController {

    @IBOutlet weak private var textField: UITextField!
    @IBOutlet weak private var button: UIButton!
    @IBOutlet weak var reversedText: UILabel!
    
    //words to reverse
    private var sentence = ""
    
    var isReversed = false
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reversedText.text = ""
        button.isEnabled = false
        textField.delegate = self
        textField.borderStyle = UITextField.BorderStyle.none
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: textField.frame.height - 1, width: textField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.white.cgColor
        textField.layer.addSublayer(bottomLine)
    }
    
    @IBAction func buttonTapped() {
        isReversed.toggle()
        if isReversed {
            button.setTitle("Clear", for: .normal)
            reversedText.text = String(sentence.components(separatedBy: " ").map({
                $0.reversed()
            }).joined(separator: " "))
        } else {
            button.setTitle("Reverse", for: .normal)
            button.isEnabled.toggle()
            textField.text = ""
            reversedText.text = ""
        }
    }
}

extension ReverseWordsViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing() -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        sentence = textField.text!
        if textField.text == "" {
            button.isEnabled = false
        } else {
            button.isEnabled = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if isReversed {
            isReversed.toggle()
            button.setTitle("Reverse", for: .normal)
        }
        return true
    }
}

