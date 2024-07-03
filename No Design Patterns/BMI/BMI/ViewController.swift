//
//  ViewController.swift
//  BMI
//
//  Created by 양귀현 on 7/2/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    var bmi: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    func makeUI() {
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        mainLabel.text = "키와 몸무게를 입력하세요"
        
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 5
        calculateButton.setTitle("BMI 계산하기", for: .normal)
        
        heightTextField.placeholder = "cm 단위로 입력해주세요."
        weightTextField.placeholder = "kg 단위로 입력해주세요."
    }


    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        bmi = calculateBMI(height: heightTextField.text!, weight: weightTextField.text!)
    }
    
    func calculateBMI(height: String, weight: String) -> Double {
        guard let h = Double(height), let w = Double(weight) else { return 0.0 }
        
        var bmi = w / (h * h) * 10000
        bmi = round(bmi * 10) / 10
        print("BMI 결과: \(bmi)")
        return bmi
    }
    
    
    
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "키와 몸무게 둘다 입력해야 합니다"
            mainLabel.textColor = .magenta
            return false
        }
        
        mainLabel.text = "키와 몸무게를 입력하세요"
        mainLabel.textColor = .black
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.bmi = bmi
        }
        
        heightTextField.text = ""
        weightTextField.text = ""
    }
    
}





extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // 숫자만 입력받음 || 지우기 같은 키가 들어왔을 때 허용
        if Int(string) != nil || string == "" {
            return true
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 두 필드가 다 채워져 있는 상태에서 엔터를 누르면 키보드 내려감
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        // 키 텍스트필드가 채워져 있을 때 엔터를 누르면 몸무게 텍스트 필드로 넘어감.
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
}

