//
//  ViewController.swift
//  Timer
//
//  Created by 양귀현 on 6/27/24.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    weak var timer: Timer?
    var number: Int = -1

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 실제 실무에서는 코드가 깔끔해지기 때문에 이런식으로 많이 사용한다.
        configureUI()
    }
    
    
    func configureUI() {
        timerLabel.text = "초를 설정하세요"
        slider.setValue(0.5, animated: true)
    }
    
    
    @IBAction func timeValueChanged(_ sender: UISlider) {
        number = Int(slider.value * 60)
        timerLabel.text = "\(number)초"
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timerLabel.text = "초를 설정하세요"
        slider.setValue(0.5, animated: true)
        number = -1
        timer?.invalidate()
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if (number < 0) {
            return
        }
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true)
        
        /*
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [self] _ in
            
            if number > 0 {
                number -= 1
                slider.setValue(Float(number) / Float(60), animated: true)
                timerLabel.text = "\(number)초"
            } else {
                number = -1
                timerLabel.text = "초를 설정하세요"
                timer?.invalidate()
                
                AudioServicesPlayAlertSound(SystemSoundID(1322))
            }
        })
        */
    }
    
    
    @objc func doSomethingAfter1Second() {
        if number > 0 {
            number -= 1
            slider.setValue(Float(number) / Float(60), animated: true)
            timerLabel.text = "\(number)초"
        } else {
            number = -1
            timerLabel.text = "초를 설정하세요"
            timer?.invalidate()
            
            AudioServicesPlayAlertSound(SystemSoundID(1322))
        }
    }
}

