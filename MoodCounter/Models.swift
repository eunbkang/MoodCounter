//
//  Models.swift
//  MoodCounter
//
//  Created by Eunbee Kang on 2023/07/25.
//

import Foundation

enum Mood: String, CaseIterable {
    case veryhappy = "완전행복지수"
    case somehappy = "적당미소지수"
    case soso = "그냥그냥지수"
    case hurt = "좀속상한지수"
    case verysad = "많이슬픈지수"
}

enum Score: Int {
    case one = 1
    case five = 5
    case ten = 10
    case reset = 0
    
    var buttonTitle: String {
        switch self {
        case .one: return "+1점"
        case .five: return "+5점"
        case .ten: return "+10점"
        case .reset: return "초기화"
        }
    }
}
