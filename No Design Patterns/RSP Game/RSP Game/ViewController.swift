//
//  ViewController.swift
//  RSP Game
//
//  Created by 양귀현 on 6/14/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var computerImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var computerChoice: UILabel!
    @IBOutlet weak var myChoice: UILabel!
    
    
    var comChoice : Rsp = Rsp(rawValue: Int.random(in: 0...2))!
    var userChoice : Rsp = Rsp.rock
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        computerChoice.text = "준비"
        computerImageView.image = UIImage.ready
        
        myChoice.text = "준비"
        myImageView.image = UIImage(named: "ready.png")
    }


    @IBAction func rspButtonTapped(_ sender: UIButton) {
        let title = sender.currentTitle!
        
        switch title {
        case "가위" :
            userChoice = Rsp.scissors
            break
        case "바위" :
            userChoice = Rsp.rock
            break
        case "보" :
            userChoice = Rsp.paper
            break
        default:
            break
        }
        
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        switch comChoice {
        case Rsp.rock:
            computerImageView.image = #imageLiteral(resourceName: "rock")
            computerChoice.text = "바위"
        case Rsp.paper:
            computerImageView.image = #imageLiteral(resourceName: "paper")
            computerChoice.text = "보"
        case Rsp.scissors:
            computerImageView.image = #imageLiteral(resourceName: "scissors")
            computerChoice.text = "가위"
        }
        
        switch userChoice {
        case Rsp.rock:
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoice.text = "바위"
        case Rsp.paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoice.text = "보"
        case Rsp.scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoice.text = "가위"
        }
        
        if comChoice == userChoice {
            mainLabel.text = "비겼습니다🤔"
        } else if comChoice == .rock && userChoice == .paper {
            mainLabel.text = "이겼습니다😙"
        } else if comChoice == .paper && userChoice == .scissors {
            mainLabel.text = "이겼습니다😙"
        } else if comChoice == .scissors && userChoice == .rock {
            mainLabel.text = "이겼습니다😙"
        } else {
            mainLabel.text = "졌습니다😢"
        }
        
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        mainLabel.text = "선택하세요!"
        
        computerImageView.image = UIImage.ready
        computerChoice.text = "준비"
        
        myImageView.image = UIImage.ready
        myChoice.text = "준비"
        
        comChoice = Rsp(rawValue: Int.random(in: 0...2))!
    }
}

