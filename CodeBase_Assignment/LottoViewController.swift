//
//  LottoViewController.swift
//  CodeBase_Assignment
//
//  Created by 강석호 on 6/5/24.
//

import UIKit
import SnapKit
import Alamofire

class LottoViewController: UIViewController {
    
    let lottoTextField = UITextField()
    let guideLabel = UILabel()
    let dateLabel = UILabel()
    let lineView = UIView()
    let labelStackView = UIStackView()
    let countLabel = UILabel()
    let resultLabel = UILabel()
    let circleStackView = UIStackView()
    let pickerView = UIPickerView()
    let pickerData = Array(800...1200)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHeirarchy()
        configureLayout()
        configureUI()
        configurePickerView()
    }
    
    func configureHeirarchy() {
        view.addSubview(lottoTextField)
        view.addSubview(guideLabel)
        view.addSubview(dateLabel)
        view.addSubview(lineView)
        view.addSubview(labelStackView)
        view.addSubview(circleStackView)
        
        labelStackView.addArrangedSubview(countLabel)
        labelStackView.addArrangedSubview(resultLabel)
    }
    
    func configureLayout() {
        lottoTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(60)
        }
        
        guideLabel.snp.makeConstraints { make in
            make.top.equalTo(lottoTextField.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(lottoTextField.snp.bottom).offset(30)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(1)
        }
        
        labelStackView.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }
        
        circleStackView.snp.makeConstraints { make in
            make.top.equalTo(labelStackView.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        
        lottoTextField.backgroundColor = .white
        lottoTextField.layer.borderWidth = 1
        lottoTextField.layer.borderColor = UIColor.black.cgColor
        lottoTextField.layer.cornerRadius = 10
        lottoTextField.inputView = pickerView
        
        guideLabel.text = "당첨번호 안내"
        guideLabel.textColor = .black
        guideLabel.font = .systemFont(ofSize: 17)
        
        dateLabel.text = "0000-00-00 추첨"
        dateLabel.textColor = .gray
        dateLabel.font = .systemFont(ofSize: 15)
        
        lineView.backgroundColor = .lightGray
        
        labelStackView.axis = .horizontal
        labelStackView.alignment = .fill
        labelStackView.distribution = .fill
        labelStackView.spacing = 5
        
        countLabel.text = "00회"
        countLabel.textColor = .orange
        countLabel.font = .boldSystemFont(ofSize: 25)
        countLabel.sizeToFit()
        
        resultLabel.text = "당첨결과"
        resultLabel.textColor = .black
        resultLabel.font = .boldSystemFont(ofSize: 25)
        resultLabel.sizeToFit()
        
        configureCircleStackView()
    }
    
    func configureCircleStackView() {
        circleStackView.axis = .horizontal
        circleStackView.alignment = .center
        circleStackView.distribution = .equalSpacing
        circleStackView.spacing = 10
        
        for _ in 1...6 {
            let circleView = UIView()
            circleView.backgroundColor = .red
            circleView.layer.cornerRadius = 23
            circleView.clipsToBounds = true
            
            circleView.snp.makeConstraints { make in
                make.width.height.equalTo(46)
            }
            
            let numberLabel = UILabel()
            numberLabel.text = ""
            numberLabel.textColor = .white
            numberLabel.font = .boldSystemFont(ofSize: 20)
            numberLabel.textAlignment = .center
            
            circleView.addSubview(numberLabel)
            numberLabel.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
            
            circleStackView.addArrangedSubview(circleView)
        }
        
        let plusImageView = UIImageView()
        plusImageView.image = UIImage(systemName: "plus")
        plusImageView.tintColor = .black
        plusImageView.contentMode = .scaleAspectFit
        
        plusImageView.snp.makeConstraints { make in
            make.width.height.equalTo(20)
        }
        
        let bonusCircleView = UIView()
        bonusCircleView.backgroundColor = .red
        bonusCircleView.layer.cornerRadius = 23
        bonusCircleView.clipsToBounds = true
        
        bonusCircleView.snp.makeConstraints { make in
            make.width.height.equalTo(46)
        }
        
        let bonusNumberLabel = UILabel()
        bonusNumberLabel.text = ""
        bonusNumberLabel.textColor = .white
        bonusNumberLabel.font = .boldSystemFont(ofSize: 20)
        bonusNumberLabel.textAlignment = .center
        
        bonusCircleView.addSubview(bonusNumberLabel)
        bonusNumberLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        circleStackView.addArrangedSubview(plusImageView)
        circleStackView.addArrangedSubview(bonusCircleView)
    }
    
    func configurePickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    func fetchLottoData(for drawNumber: Int) {
        let url = "\(APIURL.lottoURL)\(drawNumber)"
        AF.request(url).responseDecodable(of: LottoData.self) { response in
            switch response.result {
            case .success(let value):
                DispatchQueue.main.async {
                    self.updateUI(with: value)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func updateUI(with data: LottoData) {
        let numbers = [data.drwtNo1, data.drwtNo2, data.drwtNo3, data.drwtNo4, data.drwtNo5, data.drwtNo6]
        for (index, number) in numbers.enumerated() {
            guard index < circleStackView.arrangedSubviews.count else { return }
            let circleView = circleStackView.arrangedSubviews[index]
            let numberLabel = circleView.subviews.first as? UILabel
            numberLabel?.text = "\(number)"
        }
        let bonusCircleView = circleStackView.arrangedSubviews.last
        let bonusNumberLabel = bonusCircleView?.subviews.first as? UILabel
        bonusNumberLabel?.text = "\(data.bnusNo)"
        dateLabel.text = data.drwNoDate  // Update the dateLabel
    }
}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(pickerData[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedNumber = pickerData[row]
        lottoTextField.text = "\(selectedNumber)"
        countLabel.text = "\(selectedNumber)회"
        fetchLottoData(for: selectedNumber)
    }
}
