//
//  AppStyle.swift
//  EpicerieIkomobi
//
//  Created by Wassim on 16/03/2024.
//

import Foundation
import UIKit

enum AppStyle {
    //COLOR
    case primaryColor
    case backgroundProductColor
    case backgroundPlusButtonColor
    case backgroundMinusButtonColor
    //FONT
    case textColor
    case title
    case title2
    case body
    case caption
    case captionBold
    
    var color: UIColor {
        switch self {
        case .primaryColor:
            return .white
        case .backgroundProductColor:
            return UIColor(named: "backgroundProductColor") ?? .lightGray
        case .backgroundPlusButtonColor:
            return UIColor(named:"backgroundPlusButtonColor") ?? .green
        case .backgroundMinusButtonColor:
            return UIColor(named:"backgroundMinusButtonColor") ?? .gray
        case .title:
            return .black
        case .body:
            return .black
        case .caption:
            return .red
        default:
            return .black
        }
    }
    
    var font: UIFont {
        switch self {
        case .title:
            return UIFont(name: "HelveticaNeue-Bold", size: 20) ?? UIFont.systemFont(ofSize: 20, weight: .bold)
        case .title2:
            return UIFont(name: "HelveticaNeue-Bold", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .bold)
        case .body:
            return UIFont(name: "HelveticaNeue-Bold", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .regular)
        case .caption:
            return UIFont(name: "HelveticaNeue", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .regular)
        case .captionBold:
            return UIFont(name: "HelveticaNeue-Bold", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .bold)
        default:
            return UIFont.systemFont(ofSize: 16, weight: .regular)
        }
    }
}
