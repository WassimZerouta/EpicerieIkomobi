//
//  AppText.swift
//  EpicerieIkomobi
//
//  Created by Wassim on 16/03/2024.
//

import Foundation
import UIKit


enum AppResourceText {
    case topViewHelloLabel
    case topViewProfilNameLabel
    case categoriesViewTitle
    case BestSellersViewTitle
    
    var text: String {
        switch self {
        case .categoriesViewTitle:
            return "Catégories"
        case .BestSellersViewTitle:
            return "Meilleures ventes"
        case .topViewHelloLabel:
            return "Bonjour"
        case .topViewProfilNameLabel:
            return  "Jean Pascal"
        }
    }
}

enum AppResourceImage {
    case topViewProfilImageView
    case cartIcon
    case tomuchInCartIcon
    case plusIcon
    case minusIcon
    
    var image: UIImage {
        switch self {
        case .topViewProfilImageView:
            return UIImage(named: "JeanPascal") ?? UIImage()
        case .cartIcon:
            return  UIImage(systemName: "cart")?.withTintColor(.gray, renderingMode: .alwaysOriginal) ?? UIImage()
        case .tomuchInCartIcon:
            return UIImage(systemName: "plus.circle.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal) ?? UIImage()
        case .plusIcon:
            return UIImage(systemName: "plus")?.withTintColor(.white, renderingMode: .alwaysOriginal) ?? UIImage()
        case .minusIcon:
            return UIImage(systemName: "minus")?.withTintColor(.gray, renderingMode: .alwaysOriginal) ?? UIImage()
        }
    }
}

enum AppResourceURL {
    case stringUrl
    
    var url: String {
        switch self {
        case .stringUrl:
            return "https://agf.ikomobi.fr/ios-hiring-test/home.json"
        }
    }
}
