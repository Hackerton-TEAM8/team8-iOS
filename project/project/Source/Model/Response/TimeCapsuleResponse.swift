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
    let imageUrl: String
    let text: String
    let createDate: String
    let isActive: Bool
    let unlockDate: String
}
