//
//  CategoriesView.swift
//  EpicerieIkomobi
//
//  Created by Wassim on 15/03/2024.
//

import Foundation
import UIKit

class CategoriesView: UIStackView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = AppResourceText.categoriesViewTitle.text
        label.textColor = AppStyleFont.title.color
        label.font = AppStyleFont.title.font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .white
        view.showsHorizontalScrollIndicator = false
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
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}


