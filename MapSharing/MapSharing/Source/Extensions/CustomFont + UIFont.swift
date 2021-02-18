//
//  CustomFont + UIFont.swift
//  MapSharing
//
//  Created by taehy.k on 2021/02/18.
//

/*
 Eng - Rubik
 Kor - NotoSansCJKKr
 */

import Foundation
import UIKit

extension UIFont {
    public enum RubikType: String {
        case bold = "Bold"
        case medium = "Medium"
        case regular = "Regular"
    }
    
    public enum NotoSansCJKkrType: String {
        case bold = "Bold"
        case medium = "Medium"
        case regular = "Regular"
    }
    
    // rawValue - enum에 선언된 타입에 맞는 value 값을 의미 / 위의 경우에는 String 값들
    static func Rubik(_ type: RubikType, size: CGFloat) -> UIFont {
        return UIFont(name: "Rubik-\(type.rawValue)", size: size)!
    }
    
    static func NotoSansCJKkr(_ type: NotoSansCJKkrType, size: CGFloat) -> UIFont {
        return UIFont(name: "NotoSansCJKkr-\(type.rawValue)", size: size)!
    }
}
