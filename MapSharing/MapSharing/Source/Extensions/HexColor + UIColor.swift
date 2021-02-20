//
//  HexColor + UIColor.swift
//  MapSharing
//
//  Created by taehy.k on 2021/02/20.
//

import UIKit

extension UIColor {
    // MARK: hex code를 이용하여 정의
    // ex. UIColor(hex: 0xF5663F)
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    // MARK: 메인 테마 색 또는 자주 쓰는 색을 정의
    // ex. label.textColor = .mainOrange
    class var backgroundGray: UIColor { UIColor(hex: 0xF1F1F5) }
    class var kakaoYellow: UIColor { UIColor(hex: 0xFFDD4D) }
    class var kakaoBrown: UIColor { UIColor(hex: 0x5C3500) }
    
    class var customGreen: UIColor { UIColor(hex: 0x0DC66A) }
    class var customGray: UIColor { UIColor(hex: 0xB0B3BA) }
    class var customBlack: UIColor { UIColor(hex: 0x0D0D0D) }
}

