//
//  TimeCapsule.swift
//  project
//
//  Created by Subeen on 9/28/24.
//

import Foundation

struct TimeCapsuleResponse: Codable {
    let timeCapsuleId: Int        // integer($int64)
    var userId: String              // string
    let imageUrl: String?            // string
    let text: String          // string
    let createDate: String          // string($date-time)
    var isActive: Bool = false           // boolean
    let unlockDate: String
    
}

extension TimeCapsuleResponse {
    static public var stub01: TimeCapsuleResponse = .init(
            timeCapsuleId: 1,
            userId: "user01",
            imageUrl: "http://example.com/image01.png",
            text: "첫 번째 타임캡슐입니다.",
            createDate: "2024-01-01T00:00:00.000000",
            isActive: true,
            unlockDate: "2024-02-01T00:00:00" // 뒤에 두 자리 00 추가
        )

        static public var stub02: TimeCapsuleResponse = .init(
            timeCapsuleId: 2,
            userId: "user02",
            imageUrl: "http://example.com/image02.png",
            text: "두 번째 타임캡슐입니다.",
            createDate: "2024-01-02T00:00:00.000000",
            isActive: false,
            unlockDate: "2024-02-02T00:00:00" // 뒤에 두 자리 00 추가
        )

        static public var stub03: TimeCapsuleResponse = .init(
            timeCapsuleId: 3,
            userId: "user03",
            imageUrl: "http://example.com/image03.png",
            text: "세 번째 타임캡슐입니다.",
            createDate: "2024-01-03T00:00:00.000000",
            isActive: true,
            unlockDate: "2024-02-03T00:00:00" // 뒤에 두 자리 00 추가
        )

        static public var stub04: TimeCapsuleResponse = .init(
            timeCapsuleId: 4,
            userId: "user04",
            imageUrl: "http://example.com/image04.png",
            text: "네 번째 타임캡슐입니다.",
            createDate: "2024-01-04T00:00:00.000000",
            isActive: false,
            unlockDate: "2024-02-04T00:00:00" // 뒤에 두 자리 00 추가
        )

        static public var stub05: TimeCapsuleResponse = .init(
            timeCapsuleId: 5,
            userId: "user05",
            imageUrl: "http://example.com/image05.png",
            text: "다섯 번째 타임캡슐입니다.",
            createDate: "2024-01-05T00:00:00.000000",
            isActive: true,
            unlockDate: "2024-02-05T00:00:00" // 뒤에 두 자리 00 추가
        )

        static public var stub06: TimeCapsuleResponse = .init(
            timeCapsuleId: 6,
            userId: "user06",
            imageUrl: "http://example.com/image06.png",
            text: "여섯 번째 타임캡슐입니다.",
            createDate: "2024-01-06T00:00:00.000000",
            isActive: false,
            unlockDate: "2024-02-06T00:00:00" // 뒤에 두 자리 00 추가
        )

        static public var stub07: TimeCapsuleResponse = .init(
            timeCapsuleId: 7,
            userId: "user07",
            imageUrl: "http://example.com/image07.png",
            text: "일곱 번째 타임캡슐입니다.",
            createDate: "2024-01-07T00:00:00.000000",
            isActive: true,
            unlockDate: "2024-02-07T00:00:00" // 뒤에 두 자리 00 추가
        )

        static public var stub08: TimeCapsuleResponse = .init(
            timeCapsuleId: 8,
            userId: "user08",
            imageUrl: "http://example.com/image08.png",
            text: "여덟 번째 타임캡슐입니다.",
            createDate: "2024-01-08T00:00:00.000000",
            isActive: false,
            unlockDate: "2024-02-08T00:00:00" // 뒤에 두 자리 00 추가
        )

        static public var stub09: TimeCapsuleResponse = .init(
            timeCapsuleId: 9,
            userId: "user09",
            imageUrl: "http://example.com/image09.png",
            text: "아홉 번째 타임캡슐입니다.",
            createDate: "2024-01-09T00:00:00.000000",
            isActive: true,
            unlockDate: "2024-02-09T00:00:00" // 뒤에 두 자리 00 추가
        )

        static public var stub10: TimeCapsuleResponse = .init(
            timeCapsuleId: 10,
            userId: "user10",
            imageUrl: "http://example.com/image10.png",
            text: "열 번째 타임캡슐입니다.",
            createDate: "2024-01-10T00:00:00.000000",
            isActive: false,
            unlockDate: "2024-02-10T00:00:00" // 뒤에 두 자리 00 추가
        )
    
    
}
