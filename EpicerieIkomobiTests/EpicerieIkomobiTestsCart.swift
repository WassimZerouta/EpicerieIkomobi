//
//  EpicerieIkomobiTestsCart.swift
//  EpicerieIkomobi
//
//  Created by Wassim on 16/03/2024.
//

import XCTest
@testable import EpicerieIkomobi

final class EpicerieIkomobiTestsCart: XCTestCase {
    
    var cartManager: CartManager!
    
    
    override func setUpWithError() throws {
        cartManager = CartManager.shared
    }

    override func tearDownWithError() throws {
        cartManager.cart = []
        cartManager = nil
        
    }

    func testAddToCart() {

        let product = Product(id: 1, name: "Fraise", price: 2.0, image: "", packaging: Packaging(unit: "", measure: 2.00))
        cartManager.addToCart(product: product)
        
        XCTAssertEqual(cartManager.cartQuantity(), 1)
    }
    
    func testRemoveFromCart() {
        
        let product = Product(id: 1, name: "Fraise", price: 2.0, image: "", packaging: Packaging(unit: "", measure: 2.00))
        cartManager.addToCart(product: product)
        cartManager.removeFromCart(productId: 1)
        
        XCTAssertEqual(cartManager.cartQuantity(), 0)
    }
    
    func testSpecificProductQuantity() {

        let product1 = Product(id: 1, name: "Fraise", price: 2.0, image: "", packaging: Packaging(unit: "", measure: 2.00))
        let product2 = Product(id: 2, name: "Pomme", price: 2.0, image: "", packaging: Packaging(unit: "", measure: 2.00))
        
        cartManager.addToCart(product: product1)
        cartManager.addToCart(product: product2)
        cartManager.addToCart(product: product2)
        
        let quantity = cartManager.specificProductQuantity(productId: 2)
        
        XCTAssertEqual(quantity, 2)
    }

}
