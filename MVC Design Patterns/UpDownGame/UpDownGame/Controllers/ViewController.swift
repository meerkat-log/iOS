//
//  ViewController.swift
//  UpDownGame
//
//  Created by 양귀현 on 6/25/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    var upDownManager = UpDownManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reset()
    }

    func reset() {
        mainLabel.text = "선택하세요!"
        numberLabel.text = ""
        upDownManager.resetNum()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let getNumber = sender.currentTitle else { return }
        numberLabel.text = getNumber
        
        guard let num = Int(getNumber) else { return }
        upDownManager.setUsersNum(num: num)
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        guard let myNumberString = numberLabel.text, let myNumber = Int(myNumberString) else { return }
        
        upDownManager.setUsersNum(num: myNumber)
        mainLabel.text = upDownManager.getUpDownResult()
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        reset()
    }
}

