//
//  ViewController.swift
//  Lesson3_ChallengeApp
//
//  Created by John Xiong on 11/30/17.
//  Copyright © 2017 John Xiong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var dataTextSwitch: UISwitch!
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var dataTextField: UITextField!
    
    
    var zipTextFieldDelegate = ZipTextFieldDelegate()
    var priceTextFieldDelegate = PriceTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zipTextField.delegate = zipTextFieldDelegate
        priceTextField.delegate = priceTextFieldDelegate
        dataTextSwitch.addTarget(self, action: #selector(ViewController.dataTextSwitched), for: .valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func dataTextSwitched() {
        dataTextField.isEnabled = dataTextSwitch.isOn ? true : false
    }
    
}

class ZipTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    /*
     Max 5 Characters
     Only numbers
    */
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text?.characters.count == 5 {
            return false
        }
        return true
    }
}

class PriceTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    /*
     Begin with $0.00
     Data fills in from right side. Pressing 3-5-2 produces $0.03, $0.35, and $3.52
    */
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text! as NSString
        var newText = oldText.replacingCharacters(in: range, with: string)
        var newTextString = String(newText)
        
        let digits = CharacterSet.decimalDigits
        var digitText = ""
        for c in (newTextString?.unicodeScalars)! {
            if digits.contains(UnicodeScalar(c.value)!) {
                digitText.append("\(c)")
            }
        }
        
        // Format the new string
        if let numOfPennies = Int(digitText) {
            newText = "$" + self.getDollarValue(value: numOfPennies) + "." + self.getCentValue(value: numOfPennies)
        } else {
            newText = "$0.00"
        }
        
        textField.text = newText
        
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text!.isEmpty {
            textField.text = "$0.00"
        }
    }
    
    func getDollarValue(value: Int) -> String {
        
        let dollars = value / 100
        
        return "\(dollars)"
    }
    
    func getCentValue(value: Int) -> String {
        var centString = ""
        
        let cents = value % 100
        
        if cents < 10 {
            centString = "0\(cents)"
        } else {
            centString = String(cents)
        }
        
        return centString
    }
}
