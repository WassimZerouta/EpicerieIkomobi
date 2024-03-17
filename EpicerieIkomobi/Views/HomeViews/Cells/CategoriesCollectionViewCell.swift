//
//  CategoriesCollectionViewCell.swift
//  EpicerieIkomobi
//
//  Created by Wassim on 15/03/2024.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    var categorie: Category? {
         didSet {
             configure(categorie: categorie!)
         }
     }
    
    let stackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var backgroundImageView: UIView = {
        let view = UIView()
        view.backgroundColor = AppStyleColor.backgroundProductColor.color
        view.layer.cornerRadius = 40
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = AppStyleFont.body.font
        label.textColor = AppStyleFont.body.color
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configure(categorie: Category) {
        if let url = URL(string: categorie.image) {
            Helpers.shared.loadImage(from: url) { result in
                switch result {
                case .success(let image):
                    self.image.image = image
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
        self.nameLabel.text = categorie.name
        
        setupViews()
    }
    
    private func setupViews() {
        contentView.addSubview(stackViewContainer)
        stackViewContainer.addArrangedSubview(backgroundImageView)
        backgroundImageView.addSubview(image)
        stackViewContainer.addArrangedSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            
            stackViewContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackViewContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackViewContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackViewContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            backgroundImageView.leftAnchor.constraint(equalTo: stackViewContainer.leftAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: stackViewContainer.rightAnchor),
            backgroundImageView.widthAnchor.constraint(equalToConstant: 60),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 60),
            
            image.widthAnchor.constraint(equalToConstant: 45),
            image.heightAnchor.constraint(equalToConstant: 45),
            image.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor),
            
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: stackViewContainer.centerXAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
        nameLabel.text = ""
    }
}
