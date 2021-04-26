//
//  ViewController.swift
//  App
//
//  Created by Kévin CARPAYE on 26/04/2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: #selector(HideKeyboard))
        view.addGestureRecognizer(tap)
    }

    @IBAction func save(_ sender: Any) {
        guard name.text!.count >= 3 else {
            name.layer.borderColor = UIColor.red.cgColor
            return
        }
        
        guard firstname.text!.count >= 3 else {
            firstname.layer.borderColor = UIColor.red.cgColor
            return
        }
        
        let validation = isValidEmailAddress(emailAddressString: email.text!)
        
        guard validation == true else {
            email.layer.borderColor = UIColor.red.cgColor
            return
        }
        
        guard phone.text!.count >= 10 else {
            phone.layer.borderColor = UIColor.red.cgColor
            return
        }
        
        print("ok")
        
    }
    
    func save() {
        
    }
    
    @objc func HideKeyboard() {
        view.endEditing(true)
        print("touched")
    }
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
}

