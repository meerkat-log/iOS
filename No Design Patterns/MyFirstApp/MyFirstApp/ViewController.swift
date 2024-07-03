//
//  ViewController.swift
//  MyFirstApp
//
//  Created by 양귀현 on 6/14/24.
//

import UIKit

class ViewController: UIViewController {
    
    // IB는 Interface Builder
    // IBOutlet은 Interface Builder의 Outlet이다.
    // @가 붙는 것은 어트리뷰트이다.
    // 컴파일러가 알 수 있도록 자세한 정보를 알려주는 것.
    // outlet은 배출구라는 뜻이다.
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    // 버튼을 누를 때마다 변경할 수 있도록 불타입 변수 추가해줌
    var temp : Bool = false
    
    
    // 앱의 화면에 들어오면 처음 실행시키는 함수
    // 아마도 안드로이드의 onCreate와 같은 함수일 듯
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 버튼의 배경 색상 변경
        myButton.backgroundColor = UIColor.green
        // 버튼의 글자 색상 변경
        myButton.setTitleColor(.black, for: .normal)
    }

    
    // Action은 행동이므로 버튼의 행동이 전달되는 것이다.
    @IBAction func buttonPressed(_ sender: UIButton) {
        if(temp == false){
            // 레이블의 텍스트를 변경
            // 안드로이드로 치면 setText
            mainLabel.text = "안녕하세요!"
            // 레이블의 배경 색상 변경
            mainLabel.backgroundColor = UIColor.yellow
            temp = true
            return
        }
        mainLabel.text = "반가워요!"
        // 컬러 리터럴. 색상을 좀 더 쉽게 선택할 수 있도록 해주는 것.
        // #colorLiteral(
        mainLabel.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        temp = false
    }
    
    
}

