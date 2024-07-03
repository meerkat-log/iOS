//
//  ViewController.swift
//  Login
//
//  Created by 양귀현 on 6/28/24.
//

import UIKit


// 클래스는 동적이기 때문에 구조체보다 느리게 동작한다.
// final을 붙이면 더이상 상속을 못하게 막기 때문에 메소드가 다이렉트 디스패치가 일어나게 한다.
// 실무에서는 대부분 ViewController를 만들 때 final을 붙인다.
// 과제 받았을 때 이거 안하면 감점 받을 수 있음.
final class ViewController: UIViewController {
    
    private let loginView = LoginView()
    
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAddTarget()
    }
    
    func setupAddTarget() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.passwordResetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
    
    
    @objc func resetButtonTapped() {
        
        // actionSheet는 아래에 나타나고 alert은 가운데에 나타남.
        let alert = UIAlertController(title: "비밀번호 재설정", message: "비밀번호를 다시 설정하시겠습니까?", preferredStyle: .alert)
        
        let success = UIAlertAction(title: "확인", style: .default) { action in
            print("확인버튼이 눌렸습니다.")
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel) { cancel in
            print("취소버튼이 눌렸습니다.")
        }
        
        alert.addAction(success)
        alert.addAction(cancel)
        
        // 다음화면으로 넘어가는 메소드
        // 얼럿을 띄우게 됨.
        present(alert, animated: true, completion: nil)
    }
    
    
    @objc func loginButtonTapped() {
        print("로그인 버튼이 눌렸습니다.")
    }
}



