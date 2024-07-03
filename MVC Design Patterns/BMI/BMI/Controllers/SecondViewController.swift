//
//  SecondViewController.swift
//  BMI
//
//  Created by 양귀현 on 7/3/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    var bmi: BMI?

    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
        
        guard let bmi = bmi else { return }
        
        bmiNumberLabel.text = "\(bmi.value)"
        bmiNumberLabel.backgroundColor = bmi.matchColor
        adviceLabel.text = bmi.advice
    }
    
    func makeUI() {
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
        backButton.setTitle("돌아가기", for: .normal)
        
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
