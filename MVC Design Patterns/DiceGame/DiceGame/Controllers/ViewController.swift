//
//  ViewController.swift
//  DiceGame
//
//  Created by 양귀현 on 6/14/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    let diceManager = DiceManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstImageView.image = diceManager.getFirstDice()
        secondImageView.image = diceManager.getFirstDice()
    }


    @IBAction func rollButtonTapped(_ sender: UIButton) {
        // 버튼을 누르면 첫번째와 두번째 이미지뷰의 이미지를 랜덤으로 변경
        firstImageView.image = diceManager.getRandomDice()
        secondImageView.image = diceManager.getRandomDice()
    }
}

