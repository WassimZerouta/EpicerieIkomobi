//
//  CartManager.swift
//  EpicerieIkomobi
//
//  Created by Wassim on 15/03/2024.
//

import Foundation

class CartManager {
    
    static let shared = CartManager()
    
    private init() {}
    
    weak var delegate: CartManagerDelegate?
    
    var cart = [Product](){
        didSet {
            delegate?.cartDidChange()
        }
    }
    
    func addToCart(product: Product) { 
        cart.append(product)
    }
    
    func removeFromCart(productId: Int) {
        if let index = cart.firstIndex(where: { $0.id == productId }) {
            cart.remove(at: index)
        }
    }
    
    func cartQuantity() -> Int{
        cart.count
    }
    
    func specificProductQuantity(productId: Int) -> Int {
        let numberOfProduct = cart.filter { $0.id == productId }
        return numberOfProduct.count
    }
}
