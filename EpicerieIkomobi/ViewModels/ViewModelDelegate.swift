//
//  HomeViewModelDelegate.swift
//  EpicerieIkomobi
//
//  Created by Wassim on 15/03/2024.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func updateView(banner: Banner, categories: [Category], products: [Product])
}

protocol TopViewModelDelegate: AnyObject {
    func updtateView(cartQuantity: Int)
}
