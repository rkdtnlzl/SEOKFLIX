//
//  BoxOfficeTableViewCell.swift
//  CodeBase_Assignment
//
//  Created by 강석호 on 6/6/24.
//

import UIKit
import SnapKit

class BoxOfficeTableViewCell: UITableViewCell {
    
    let rankView = UIView()
    let rankLabel = UILabel()
    let movieNameLabel = UILabel()
    let openDateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureUI()
        configureLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundColor = .white
    }
    
    func configureUI() {
        contentView.addSubview(rankView)
        rankView.addSubview(rankLabel)
        contentView.addSubview(movieNameLabel)
        contentView.addSubview(openDateLabel)
        
        rankView.backgroundColor = .white
        rankLabel.font = UIFont.boldSystemFont(ofSize: 17)
        rankLabel.textColor = .black
        movieNameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        movieNameLabel.textColor = .white
        openDateLabel.font = UIFont.systemFont(ofSize: 14)
        openDateLabel.textColor = .gray
    }
    
    func configureLayout() {
        
        rankView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(15)
            make.leading.equalToSuperview().inset(10)
            make.width.equalTo(50)
        }
        
        rankLabel.snp.makeConstraints { make in
            make.center.equalTo(rankView)
        }
        
        movieNameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(rankView.snp.trailing).offset(20)
            make.width.equalTo(200)
        }
        
        openDateLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
        }
    }
    
    func configureCellData(_ data: DailyBoxOffice) {
        rankLabel.text = data.rank
        movieNameLabel.text = data.movieNm
        openDateLabel.text = data.openDt
    }
}
