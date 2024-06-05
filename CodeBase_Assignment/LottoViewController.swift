//
//  LottoViewController.swift
//  CodeBase_Assignment
//
//  Created by 강석호 on 6/5/24.
//

import UIKit

class LottoViewController: UIViewController {

    let lottoTextField = UITextField()
    let guideLabel = UILabel()
    let dateLabel = UILabel()
    let lineView = UIView()
    let countLabel = UILabel()
    let resultLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHeirarchy()
        configureLayout()
        configureUI()
    }
    
    func configureHeirarchy() {
        view.addSubview(lottoTextField)
        view.addSubview(guideLabel)
        view.addSubview(dateLabel)
        view.addSubview(lineView)
        view.addSubview(countLabel)
        view.addSubview(resultLabel)
    }

    func configureLayout() {
        
        
    }
    
    func configureUI() {
        view.backgroundColor = .white
        
    }
}
