//
//  Date+Extension.swift
//  MoodCounter
//
//  Created by Eunbee Kang on 2023/07/26.
//

import Foundation

extension Date {
    func dateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
}
