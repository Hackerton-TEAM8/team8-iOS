//
//  UIImageView+.swift
//  project
//
//  Created by 최지우 on 9/29/24.
//

import UIKit
import Kingfisher

extension UIImageView{
    func kfSetImage(url : String?){
        
        guard let url = url else { return }
        
        if let url = URL(string: url) {
            kf.indicatorType = .activity
            kf.setImage(with: url,
                        placeholder: nil,
                        options: [.transition(.fade(1.0))], progressBlock: nil)
        }
    }
}
