//
//  String+Extension.swift
//  project
//
//  Created by 어재선 on 9/28/24.
//

import Foundation

extension String {
    // "yyyy-MM-dd'T'HH:mm:ss" 형식의 문자열을 "yyyy-MM-dd"로 변환하는 메서드
    func formatSSSSSSToDate() -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
        inputFormatter.locale = Locale(identifier: "ko_KO")
        inputFormatter.timeZone = TimeZone(secondsFromGMT: 0)

        if let date = inputFormatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "yyyy-MM-dd"
            outputFormatter.locale = Locale(identifier: "ko_KO")
            
            return outputFormatter.string(from: date)
        } else {
            return nil // 변환에 실패한 경우 nil 반환
        }
    }
    func formatSSToDate() -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        inputFormatter.locale = Locale(identifier: "ko_KO")
        inputFormatter.timeZone = TimeZone(secondsFromGMT: 0)

        if let date = inputFormatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "yyyy-MM-dd"
            outputFormatter.locale = Locale(identifier: "ko_KO")
            
            return outputFormatter.string(from: date)
        } else {
            return nil // 변환에 실패한 경우 nil 반환
        }
    }
}
