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
    
    var randomNumber :Int = Int.random(in: 1...10)
    var selectedNumber : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.text = "선택하세요!"
        numberLabel.text = ""
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let getNumber = sender.currentTitle else { return }
        
        numberLabel.text = getNumber
        selectedNumber = Int(getNumber)!
        
        //guard let num = Int(getNumber) else { return }
        //selectedNumber = num
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        if (selectedNumber < randomNumber) {
            mainLabel.text = "⬆️ UP ⬆️"
        } else if (selectedNumber > randomNumber) {
            mainLabel.text = "⬇️ DOWN ⬇️"
        } else {
            mainLabel.text = "😎 BINGO 😎"
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        mainLabel.text = "선택하세요!"
        numberLabel.text = ""
        randomNumber = Int.random(in: 1...10)
        selectedNumber = 1
    }
}

