//
//  MainViewController.swift
//  SEOKFLIX
//
//  Created by 강석호 on 6/4/24.
//

import UIKit

class MainViewController: UIViewController {
    
    let posterImageView = UIImageView()
    let playButton = UIButton()
    let favorateButton = UIButton()
    let buttonStackView = UIStackView()
    let hotLabel = UILabel()
    let hotStackView = UIStackView()
    let hotFirstImageView = UIImageView()
    let hotSecondImageView = UIImageView()
    let hotThirdImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    func configureHierarchy() {
        
        view.addSubview(posterImageView)
        view.addSubview(buttonStackView)
        view.addSubview(hotLabel)
        view.addSubview(hotStackView)
        
        buttonStackView.addArrangedSubview(playButton)
        buttonStackView.addArrangedSubview(favorateButton)
        
        hotStackView.addArrangedSubview(hotFirstImageView)
        hotStackView.addArrangedSubview(hotSecondImageView)
        hotStackView.addArrangedSubview(hotThirdImageView)
    }
    
    func configureLayout() {
        
        posterImageView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(0)
            //            make.height.equalTo(posterImageView.snp.width).multipliedBy(1.3)
            make.height.equalTo(440)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(posterImageView).inset(20)
            make.bottom.equalTo(posterImageView).inset(10)
            make.height.equalTo(44)
        }
        
        hotLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(posterImageView.snp.bottom).offset(10)
        }
        
        hotStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(hotLabel.snp.bottom).offset(5)
            make.height.equalTo(200)
        }
        
    }
    
    func configureUI() {
        
        view.backgroundColor = .black
        navigationItem.title = "석호님"
        
        posterImageView.image = UIImage(named: "명량")
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.clipsToBounds = true
        
        buttonStackView.axis = .horizontal
        buttonStackView.alignment = .fill
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 10
        
        playButton.setTitle(" 재생", for: .normal)
        playButton.setTitleColor(.black, for: .normal)
        playButton.backgroundColor = .white
        playButton.layer.cornerRadius = 10
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playButton.imageView?.contentMode = .scaleAspectFit
        playButton.tintColor = .black
        playButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        
        favorateButton.setTitle("찜한 리스트", for: .normal)
        favorateButton.setTitleColor(.white, for: .normal)
        favorateButton.backgroundColor = .darkGray
        favorateButton.layer.cornerRadius = 10
        favorateButton.setImage(UIImage(systemName: "plus"), for: .normal)
        favorateButton.imageView?.contentMode = .scaleAspectFit
        favorateButton.tintColor = .white
        favorateButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        
        hotLabel.text = "지금 뜨는 콘텐츠"
        hotLabel.textColor = .white
        hotLabel.font = .boldSystemFont(ofSize: 17)
        
        hotStackView.axis = .horizontal
        hotStackView.alignment = .fill
        hotStackView.distribution = .fillEqually
        hotStackView.spacing = 5
        
        hotFirstImageView.image = UIImage(named: "도둑들")
        hotFirstImageView.contentMode = .scaleAspectFit
        hotFirstImageView.clipsToBounds = true
        hotFirstImageView.layer.cornerRadius = 10
        
        hotSecondImageView.image = UIImage(named: "부산행")
        hotSecondImageView.contentMode = .scaleAspectFit
        hotSecondImageView.clipsToBounds = true
        hotSecondImageView.layer.cornerRadius = 10
        
        hotThirdImageView.image = UIImage(named: "베테랑")
        hotThirdImageView.contentMode = .scaleAspectFit
        hotThirdImageView.clipsToBounds = true
        hotSecondImageView.layer.cornerRadius = 10
    }
    
}
