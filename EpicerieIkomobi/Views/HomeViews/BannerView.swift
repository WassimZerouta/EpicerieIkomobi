//
//  HomeViewBanner.swift
//  EpicerieIkomobi
//
//  Created by Wassim on 15/03/2024.
//

import Foundation
import UIKit

class BannerView: UIImageView {
    
    var bannerStringUrl: String? {
        didSet {
            setupViews()
        }
    }
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func setupViews() {
        if let url = URL(string: bannerStringUrl!) {
            Helpers.shared.loadImage(from: url) { result in
                switch result {
                case .success(let image):
                    self.image = image
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
