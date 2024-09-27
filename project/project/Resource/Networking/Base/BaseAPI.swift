//
//  BaseAPI.swift
//  project
//
//  Created by Subeen on 9/28/24.
//

import Foundation

public enum BaseAPI: String {
    case base
    
    public var apiDesc: String {
        switch self {
        case .base:
            return "https://ec2-3-35-208-173.ap-northeast-2.compute.amazonaws.com:80"
        }
    }
}
