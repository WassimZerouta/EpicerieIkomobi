//
//  BestSellersView.swift
//  EpicerieIkomobi
//
//  Created by Wassim on 15/03/2024.
//

import Foundation
import UIKit

class BestSellersView: UIStackView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = AppRessource.BestSellersViewTitle.text
        label.textColor = AppStyle.title.color
        label.font = AppStyle.title.font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .white
        view.isScrollEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        axis = .vertical
        spacing = 10
        addArrangedSubview(titleLabel)
        addArrangedSubview(collectionView)
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ])
    }
}
