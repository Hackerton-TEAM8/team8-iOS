//
//  UIImage+Extension.swift
//  project
//
//  Created by Subeen on 9/28/24.
//

import UIKit


public extension UIImage {
    
    /// 이미지 합치기 (이미지 + 캔버스 드로잉)
    func mergeWith(topImage: UIImage) -> UIImage {
            let bottomImage = self

            UIGraphicsBeginImageContext(size)

            let areaSize = CGRect(x: 0, y: 0, width: bottomImage.size.width, height: bottomImage.size.height)
            bottomImage.draw(in: areaSize)

            topImage.draw(in: areaSize, blendMode: .normal, alpha: 1.0)

            let mergedImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            return mergedImage
        }
}
