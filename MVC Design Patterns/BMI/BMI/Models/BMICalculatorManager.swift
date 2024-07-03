//
//  BMICalculatorManager.swift
//  BMI
//
//  Created by 양귀현 on 7/3/24.
//

import UIKit

struct BMICalculatorManager {
    var bmi: BMI?
    
    mutating func getBMI(height: String, weight: String) -> BMI {
        calculateBMI(height: height, weight: weight)
        return self.bmi ?? BMI(value: 0.0, matchColor: UIColor.white, advice: "오류")
    }
    
    mutating func calculateBMI(height: String, weight: String) {
        guard let h = Double(height), let w = Double(weight) else {
            self.bmi = BMI(value: 0.0, matchColor: UIColor.white, advice: "오류")
            return
        }
        
        var bmi = w / (h * h) * 10000
        bmi = round(bmi * 10) / 10
        
        switch bmi {
        case ..<18.6:
            self.bmi = BMI(value: bmi, matchColor: UIColor(red: 22/255, green: 231/255, blue: 207/255, alpha: 1), advice: "저체중")
        case 18.6..<23.0:
            self.bmi = BMI(value: bmi, matchColor: UIColor(red: 212/255, green: 251/255, blue: 121/255, alpha: 1), advice: "표준")
        case 23.0..<25.0:
            self.bmi = BMI(value: bmi, matchColor: UIColor(red: 218/255, green: 127/255, blue: 163/255, alpha: 1), advice: "과체중")
        case 25.0..<30.0:
            self.bmi = BMI(value: bmi, matchColor: UIColor(red: 255/255, green: 150/255, blue: 141/255, alpha: 1), advice: "중도비만")
        case 30.0...:
            self.bmi = BMI(value: bmi, matchColor: UIColor(red: 255/255, green: 100/255, blue: 78/255, alpha: 1), advice: "고도비만")
        default:
            self.bmi = BMI(value: 0.0, matchColor: UIColor.white, advice: "오류")
        }
    }
}
