//
//  DateFormatter.swift
//  project
//
//  Created by Subeen on 9/29/24.
//

import Foundation

extension DateFormatter {
    static let customFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy-MM-dd"
        return formatter
    }()
}
