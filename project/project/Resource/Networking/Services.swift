//
//  Services.swift
//  project
//
//  Created by Subeen on 9/28/24.
//

import Foundation

protocol ServiceType {
    var homeService: HomeServiceType { get set }
}

class Services: ServiceType {
    var homeService: HomeServiceType
    
    init() {
        self.homeService = HomeService()
    }
}

// 프리뷰용 서비스
class StubServices: ServiceType {
    var homeService: HomeServiceType = StubHomeService()
}
