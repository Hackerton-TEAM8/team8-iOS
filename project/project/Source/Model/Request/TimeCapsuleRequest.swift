//
//  TimeCapsuleRequest.swift
//  project
//
//  Created by 어재선 on 9/28/24.
//

import Foundation

struct TimeCapsuleRequest: Codable {
    let userId: Int
    let title: String
    let text: String
    let unlockDate: String
    let isActive: Bool
    
}
