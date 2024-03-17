//
//  BestSellersCollectionViewCellViewModel.swift
//  EpicerieIkomobi
//
//  Created by Wassim on 16/03/2024.
//

import Foundation

class BestSellersCollectionViewCellViewModel {
    
    private let cartManager = CartManager.shared
    
    func addToCart(product: Product) {
        cartManager.addToCart(product: product)
    }
    
    func removeFromCart(productId: Int) {
        cartManager.removeFromCart(productId: productId)
    }
    
    func specificProductQuantity(productId: Int) -> Int {
        cartManager.specificProductQuantity(productId: productId)
    }
    
}
