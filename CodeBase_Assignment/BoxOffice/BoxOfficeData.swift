//
//  BoxOfficeData.swift
//  CodeBase_Assignment
//
//  Created by 강석호 on 6/5/24.
//

import Foundation

struct BoxOfficeResult: Codable {
    let boxOfficeResult: BoxOfficeList
}

struct BoxOfficeList: Codable {
    let boxofficeType: String
    let showRange: String
    let dailyBoxOfficeList: [DailyBoxOffice]
}

struct DailyBoxOffice: Codable {
    let rnum: String
    let rank: String
    let rankInten: String
    let rankOldAndNew: String
    let movieCd: String
    let movieNm: String
    let openDt: String
    let salesAmt: String
    let salesShare: String
    let salesInten: String
    let salesChange: String
    let salesAcc: String
    let audiCnt: String
    let audiInten: String
    let audiChange: String
    let audiAcc: String
    let scrnCnt: String
    let showCnt: String
}
