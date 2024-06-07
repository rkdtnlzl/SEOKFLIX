//
//  ViewController.swift
//  SEOKFLIX
//
//  Created by 강석호 on 6/4/24.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {

    let titleLabel = UILabel()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let nicknameTextField = UITextField()
    let locationTextField = UITextField()
    let codeTextField = UITextField()
    let signButton = UIButton()
    let plusButton = UIButton()
    let switchButton = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        buttonTarget()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func configureHierarchy() {
        
        view.addSubview(titleLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(nicknameTextField)
        view.addSubview(locationTextField)
        view.addSubview(codeTextField)
        view.addSubview(signButton)
        view.addSubview(switchButton)
        view.addSubview(plusButton)
    }
    
    func configureLayout() {
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(50)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.top.equalTo(titleLabel.snp.bottom).offset(100)
            make.height.equalTo(44)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.height.equalTo(44)
        }
        
        nicknameTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.height.equalTo(44)
        }
        
        locationTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.top.equalTo(nicknameTextField.snp.bottom).offset(20)
            make.height.equalTo(44)
        }
        
        codeTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.top.equalTo(locationTextField.snp.bottom).offset(20)
            make.height.equalTo(44)
        }
        
        signButton.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.top.equalTo(codeTextField.snp.bottom).offset(30)
            make.height.equalTo(52)
        }
        
        switchButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.top.equalTo(signButton.snp.bottom).offset(30)
            make.height.equalTo(52)
        }
        
        plusButton.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.top.equalTo(signButton.snp.bottom).offset(20)
            make.height.equalTo(52)
            make.width.equalTo(100)
        }
    }
    
    func configureUI() {
        
        view.backgroundColor = .black
        
        titleLabel.text = "SEOKFLIX"
        titleLabel.textColor = .orange
        titleLabel.font = .boldSystemFont(ofSize: 35)
        
        emailTextField.backgroundColor = .white
        emailTextField.placeholder = "이메일 주소를 입력하세요"
        emailTextField.layer.cornerRadius = 10
        
        passwordTextField.backgroundColor = .white
        passwordTextField.placeholder = "비밀번호를 입력하세요"
        passwordTextField.layer.cornerRadius = 10
        
        nicknameTextField.backgroundColor = .white
        nicknameTextField.placeholder = "닉네임을 입력하세요"
        nicknameTextField.layer.cornerRadius = 10
        
        locationTextField.backgroundColor = .white
        locationTextField.placeholder = "지역을 입력하세요"
        locationTextField.layer.cornerRadius = 10
        
        codeTextField.backgroundColor = .white
        codeTextField.placeholder = "추천코드를 입력하세요"
        codeTextField.layer.cornerRadius = 10
        
        signButton.backgroundColor = .cyan
        signButton.setTitle("회원가입(시작하기)", for: .normal)
        signButton.setTitleColor(.black, for: .normal)
        signButton.layer.cornerRadius = 10
        
        switchButton.setOn(true, animated: false)
        
        plusButton.backgroundColor = .clear
        plusButton.setTitle("추가정보입력", for: .normal)
        plusButton.setTitleColor(.white, for: .normal)
    }
    
    func buttonTarget() {
        signButton.addTarget(self, action: #selector(signButtonClicked), for: .touchUpInside)
    }
    
    @objc func signButtonClicked() {
        print(#function)
        let tabBarVC = TabBarViewController()
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate.changeRootViewController(to: tabBarVC)
        }
    }
}

