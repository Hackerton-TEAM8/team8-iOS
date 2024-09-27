//
//  BaseTargetType.swift
//  project
//
//  Created by Subeen on 9/28/24.
//

import Foundation
import Moya

public protocol BaseTargetType: TargetType {}

extension BaseTargetType {
    public var baseURL: URL {
        return URL(string: BaseAPI.base.apiDesc)!
    }
}
