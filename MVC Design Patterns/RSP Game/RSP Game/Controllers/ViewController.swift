//
//  ViewController.swift
//  RSP Game
//
//  Created by 양귀현 on 6/14/24.
//

import UIKit

class ViewController: UIViewController {
    
    var rspManager = RSPManager()
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var computerImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var computerChoice: UILabel!
    @IBOutlet weak var myChoice: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    func configureUI() {
        computerChoice.text = rspManager.getReady().rspInfo.name
        computerImageView.image = rspManager.getReady().rspInfo.image
        
        myChoice.text = rspManager.getReady().rspInfo.name
        myImageView.image = rspManager.getReady().rspInfo.image
    }

    @IBAction func rspButtonTapped(_ sender: UIButton) {
        let title = sender.currentTitle!
        
        rspManager.userGetSelected(name: title)
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        computerImageView.image = rspManager.getComputerRSP().rspInfo.image
        computerChoice.text = rspManager.getComputerRSP().rspInfo.name
        
        myImageView.image = rspManager.getUserRSP().rspInfo.image
        myChoice.text = rspManager.getUserRSP().rspInfo.name
        
        mainLabel.text = rspManager.getRpsResult()
    }
    
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        mainLabel.text = "선택하세요!"
        
        computerImageView.image = rspManager.getReady().rspInfo.image
        computerChoice.text = rspManager.getReady().rspInfo.name
        
        myImageView.image = rspManager.getReady().rspInfo.image
        myChoice.text = rspManager.getReady().rspInfo.name
        
        rspManager.allReset()
    }
}

