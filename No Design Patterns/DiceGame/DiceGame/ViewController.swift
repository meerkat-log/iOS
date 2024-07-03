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
    
    // imageLiteral( 로 선택
    let diceArray: [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstImageView.image = diceArray[0]
        secondImageView.image = diceArray[0]
    }


    @IBAction func rollButtonTapped(_ sender: UIButton) {
        // 버튼을 누르면 첫번째와 두번째 이미지뷰의 이미지를 랜덤으로 변경
        firstImageView.image = diceArray.randomElement()
        secondImageView.image = diceArray.randomElement()
    }
}

