//
//  BoxOfficeViewController.swift
//  CodeBase_Assignment
//
//  Created by 강석호 on 6/5/24.
//

import UIKit
import Alamofire
import SnapKit

class BoxOfficeViewController: UIViewController {
    
    let dateTextField = UITextField()
    let dateTextFieldLine = UIView()
    let searchButton = UIButton()
    let tableView = UITableView()
    var boxOfficeData: [DailyBoxOffice] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        configureTableView()
        configureActions()
    }
    
    func configureHierarchy() {
        
        view.addSubview(dateTextField)
        view.addSubview(dateTextFieldLine)
        view.addSubview(searchButton)
        view.addSubview(tableView)
    }
    
    func configureLayout() {
        
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.width.equalTo(290)
            make.height.equalTo(56)
        }
        
        dateTextFieldLine.snp.makeConstraints { make in
            make.top.equalTo(dateTextField.snp.bottom).offset(5)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.width.equalTo(dateTextField.snp.width)
            make.height.equalTo(4)
            
        }
        
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.leading.equalTo(dateTextField.snp.trailing).offset(10)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(60)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchButton.snp.bottom).offset(22)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    func configureUI() {
        
        view.backgroundColor = .black
        
        dateTextField.backgroundColor = .clear
        dateTextField.textColor = .white
        
        dateTextFieldLine.backgroundColor = .white
        
        searchButton.backgroundColor = .lightGray
        searchButton.setTitle("검색", for: .normal)
        searchButton.setTitleColor(.black, for: .normal)
        
        tableView.rowHeight = 66
        tableView.backgroundColor = .black
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(BoxOfficeTableViewCell.self, forCellReuseIdentifier: "BoxOfficeTableViewCell")
    }
    
    func configureActions() {
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    @objc func searchButtonTapped() {
        let date = dateTextField.text
        fetchBoxOfficeData(for: date!)
    }
    
    func fetchBoxOfficeData(for date: String) {
        let apiKey = APIKey.movieKey
        let urlString = "\(APIURL.movieURL)\(apiKey)&targetDt=\(date)"
        
        AF.request(urlString).responseDecodable(of: BoxOfficeResult.self) { response in
            switch response.result {
            case .success(let result):
                self.boxOfficeData = result.boxOfficeResult.dailyBoxOfficeList
                print("Fetched Data: \(result)")
                self.tableView.reloadData()
            case .failure(let error):
                print("Error fetching data: \(error)")
                
            }
        }
    }
}

extension BoxOfficeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boxOfficeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BoxOfficeTableViewCell", for: indexPath) as! BoxOfficeTableViewCell
        let boxOffice = boxOfficeData[indexPath.row]
        cell.configureCellData(boxOffice)
        cell.backgroundColor = .black
        
        return cell
    }
}
