//
//  TopViewModel.swift
//  EpicerieIkomobi
//
//  Created by Wassim on 16/03/2024.
//

import Foundation

class TopViewModel: CartManagerDelegate {
    
    private let cartManager = CartManager.shared
    weak var delegate: TopViewModelDelegate?
    
    func cartDidChange() {
        let cartQuantity = cartQuantity()
        delegate?.updtateView(cartQuantity: cartQuantity)
    }
    
    init() {
        cartManager.delegate = self
    }
    
    private func cartQuantity() -> Int {
        cartManager.cartQuantity()
    }
}
