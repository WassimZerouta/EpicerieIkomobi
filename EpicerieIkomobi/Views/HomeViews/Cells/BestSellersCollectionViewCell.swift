//
//  BestSellersCollectionViewCell.swift
//  EpicerieIkomobi
//
//  Created by Wassim on 15/03/2024.
//

import UIKit

class BestSellersCollectionViewCell: UICollectionViewCell {
    
    let viewModel = BestSellersCollectionViewCellViewModel()
    
    var product:Product? {
        didSet {
            configure(product: product!)
        }
    }
    
    var backgroundImageView: UIView = {
        let view = UIView()
        view.backgroundColor = AppStyle.backgroundProductColor.color
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let firstStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.font = AppStyle.body.font
        label.textAlignment = .left
        label.textColor = AppStyle.body.color
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var weightLabel: UILabel = {
        let label = UILabel()
        label.font = AppStyle.caption.font
        label.textAlignment = .left
        label.textColor = AppStyle.caption.color
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.font = AppStyle.captionBold.font
        label.textAlignment = .left
        label.textColor = AppStyle.caption.color
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let secondStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var quantityLabel: UILabel = {
        let label = UILabel()
        label.font = AppStyle.title.font
        label.text = ""
        label.textColor = AppStyle.title.color
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var plusButton: UIView = {
        let view = UIView()
        view.backgroundColor = AppStyle.backgroundPlusButtonColor.color
        view.layer.cornerRadius = 18
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var plusImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = AppResource.plusIcon.image
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    var minusButton: UIView = {
        let view = UIView()
        view.backgroundColor = AppStyle.backgroundMinusButtonColor.color
        view.layer.cornerRadius = 18
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var minusImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = AppResource.minusIcon.image
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    func configure(product: Product) {
        if let url = URL(string: product.image) {
            Helpers.shared.loadImage(from: url) { result in
                switch result {
                case .success(let image):
                    self.image.image = image
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
        self.nameLabel.text = product.name
        self.priceLabel.text = "\(product.price)€"
        self.weightLabel.text = product.packaging.measure.description+" "+product.packaging.unit.description
        
        setupViews()
    }
    
    
    private func setupViews() {
        contentView.addSubview(backgroundImageView)
        backgroundImageView.addSubview(image)
        
        backgroundImageView.addSubview(firstStackViewContainer)
        
        firstStackViewContainer.addArrangedSubview(nameLabel)
        firstStackViewContainer.addArrangedSubview(weightLabel)
        firstStackViewContainer.addArrangedSubview(priceLabel)
        
        backgroundImageView.addSubview(secondStackViewContainer)
        
        secondStackViewContainer.addArrangedSubview(minusButton)
        secondStackViewContainer.addArrangedSubview(quantityLabel)
        secondStackViewContainer.addArrangedSubview(plusButton)
        
        minusButton.addSubview(minusImageView)
        plusButton.addSubview(plusImageView)
        
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backgroundImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            image.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 20),
            image.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: 120),
            
            firstStackViewContainer.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            firstStackViewContainer.leftAnchor.constraint(equalTo: backgroundImageView.leftAnchor,constant: 10),
            firstStackViewContainer.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor,constant: -10),
            
            secondStackViewContainer.rightAnchor.constraint(equalTo: backgroundImageView.rightAnchor,constant: -10),
            secondStackViewContainer.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor,constant: -10),
            
            plusButton.heightAnchor.constraint(equalToConstant: 35),
            plusButton.widthAnchor.constraint(equalToConstant: 35),
            
            plusImageView.centerXAnchor.constraint(equalTo: plusButton.centerXAnchor),
            plusImageView.centerYAnchor.constraint(equalTo: plusButton.centerYAnchor),
            plusImageView.heightAnchor.constraint(equalToConstant: 20),
            plusImageView.widthAnchor.constraint(equalToConstant: 20),
            
            minusButton.heightAnchor.constraint(equalToConstant: 35),
            minusButton.widthAnchor.constraint(equalToConstant: 35),
            
            minusImageView.centerXAnchor.constraint(equalTo: minusButton.centerXAnchor),
            minusImageView.centerYAnchor.constraint(equalTo: minusButton.centerYAnchor),
            minusImageView.heightAnchor.constraint(equalToConstant: 20),
            minusImageView.widthAnchor.constraint(equalToConstant: 20),
            
        ])
        minusButton.isHidden = true
        
        let tapMinusButtonGesture = UITapGestureRecognizer(target: self, action: #selector(minusButtonTapped))
        minusButton.addGestureRecognizer(tapMinusButtonGesture)
        
        let tapPlusButtonGesture = UITapGestureRecognizer(target: self, action: #selector(plusButtonTapped))
        plusButton.addGestureRecognizer(tapPlusButtonGesture)
    }
    
    @objc func minusButtonTapped() {
        if let product = product {
            viewModel.removeFromCart(productId: product.id)
            if viewModel.specificProductQuantity(productId: product.id) == 0 {
                minusButton.isHidden = true
                quantityLabel.isHidden = true
            } else {
                minusButton.isHidden = false
                quantityLabel.isHidden = false
                quantityLabel.text = viewModel.specificProductQuantity(productId: product.id).description
            }
        }
        
    }
    
    @objc func plusButtonTapped() {
        if let product = product {
            viewModel.addToCart(product: product)
            if viewModel.specificProductQuantity(productId: product.id) == 0 {
                minusButton.isHidden = true
                quantityLabel.isHidden = true
            } else {
                minusButton.isHidden = false
                quantityLabel.isHidden = false
                quantityLabel.text = viewModel.specificProductQuantity(productId: product.id).description
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
        nameLabel.text = ""
    }
}
