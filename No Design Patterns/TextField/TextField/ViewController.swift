//
//  ViewController.swift
//  TextField
//
//  Created by 양귀현 on 6/28/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        setup()
    }
    
    func setup() {
        view.backgroundColor = UIColor.gray
        
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "E-mail 입력"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        
        // 자동으로 키보드가 올라오고 포커스 하도록 하는 기능
        textField.becomeFirstResponder()
    }

    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        // 키보드를 숨기는 기능
        textField.resignFirstResponder()
    }
    
    
    // 화면의 탭을 감지하는 메소드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        /*
         let maxLength = 10
         let currentString: NSString = (textField.text ?? "") as NSString
         let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
         return newString.length <= maxLength
         */
        
        print(range)
        print(string)
        
        if Int(string) != nil {
            return false
        } else {
            guard let text = textField.text else { return true }
            let newLength = text.count + string.count - range.length
            return newLength <= 10
        }
    }
}


