//
//  TimeCapsule.swift
//  project
//
//  Created by Subeen on 9/28/24.
//

import Foundation

struct TimeCapsuleResponse: Codable {
    let timeCapsuleId: Int
    let userId: String
    let imageUrl: String?
    let text: String
    let createDate: String
    let isActive: Bool
    let unlockDate: String
}

extension TimeCapsuleResponse {
    static public var stub01: TimeCapsuleResponse = .init(
        timeCapsuleId: 1,
        userId: "김하나",
        imageUrl: "testPhoto",
        text: "여름 날",
        createDate: "2024-07-30T00:00:00.000000",
        isActive: true,
        unlockDate: "2024-09-28T00:00:00"
    )

    static public var stub02: TimeCapsuleResponse = .init(
        timeCapsuleId: 2,
        userId: "김두울",
        imageUrl: "capsule",
        text: "구름 강아지",
        createDate: "2024-01-02T00:00:00.000000",
        isActive: false,
        unlockDate: "2024-02-02T00:00:00"
    )

    static public var stub03: TimeCapsuleResponse = .init(
        timeCapsuleId: 3,
        userId: "김세셋",
        imageUrl: "ocean",
        text: "바다 향기",
        createDate: "2024-03-15T00:00:00.000000",
        isActive: true,
        unlockDate: "2024-05-01T00:00:00.00"
    )

    static public var stub04: TimeCapsuleResponse = .init(
        timeCapsuleId: 4,
        userId: "김사넷",
        imageUrl: "sunset",
        text: "노을빛",
        createDate: "2024-04-12T00:00:00.000000",
        isActive: false,
        unlockDate: "2024-06-12T00:00:00.00"
    )

    static public var stub05: TimeCapsuleResponse = .init(
        timeCapsuleId: 5,
        userId: "김오다섯",
        imageUrl: "forest",
        text: "숲속 이야기",
        createDate: "2024-05-22T00:00:00.000000",
        isActive: true,
        unlockDate: "2024-07-22T00:00:00.00"
    )

    static public var stub06: TimeCapsuleResponse = .init(
        timeCapsuleId: 6,
        userId: "김육여섯",
        imageUrl: "mountain",
        text: "산의 정기",
        createDate: "2024-06-10T00:00:00.000000",
        isActive: false,
        unlockDate: "2024-08-10T00:00:00.00"
    )

    static public var stub07: TimeCapsuleResponse = .init(
        timeCapsuleId: 7,
        userId: "김칠일곱",
        imageUrl: "city",
        text: "도시의 밤",
        createDate: "2024-07-05T00:00:00.000000",
        isActive: true,
        unlockDate: "2024-09-05T00:00:00.00"
    )

    static public var stub08: TimeCapsuleResponse = .init(
        timeCapsuleId: 8,
        userId: "김팔여덟",
        imageUrl: "sky",
        text: "하늘 아래",
        createDate: "2024-08-20T00:00:00.000000",
        isActive: false,
        unlockDate: "2024-10-20T00:00:00.00"
    )

    static public var stub09: TimeCapsuleResponse = .init(
        timeCapsuleId: 9,
        userId: "김구아홉",
        imageUrl: "lake",
        text: "호수의 물결",
        createDate: "2024-09-01T00:00:00.000000",
        isActive: true,
        unlockDate: "2024-11-01T00:00:00.00"
    )

    static public var stub10: TimeCapsuleResponse = .init(
        timeCapsuleId: 10,
        userId: "김십열",
        imageUrl: "desert",
        text: "사막의 바람",
        createDate: "2024-10-10T00:00:00.000000",
        isActive: false,
        unlockDate: "2024-12-10T00:00:00.00"
    )
}
