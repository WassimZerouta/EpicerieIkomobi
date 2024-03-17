//
//  TopView.swift
//  EpicerieIkomobi
//
//  Created by Wassim on 16/03/2024.
//

import Foundation
import UIKit

class TopView: UIView {
    
    let viewModel = TopViewModel()
    
    let profilImageView: UIImageView = {
        let view = UIImageView()
        view.image = AppResource.topViewProfilImageView.image
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let helloLabel: UILabel = {
        let label = UILabel()
        label.text = AppResource.topViewHelloLabel.text
        label.textColor = .lightGray
        label.font = AppStyle.captionBold.font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let profilNameLabel: UILabel = {
        let label = UILabel()
        label.text = AppResource.topViewProfilNameLabel.text
        label.textColor = AppStyle.textColor.color
        label.font = AppStyle.title2.font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var backgroundImageView: UIView = {
        let view = UIView()
        view.backgroundColor = AppStyle.backgroundProductColor.color
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var cartImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = AppResource.cartIcon.image
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var cartQuantityImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        viewModel.delegate = self
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        addSubview(profilImageView)
        addSubview(stackViewContainer)
        stackViewContainer.addArrangedSubview(helloLabel)
        stackViewContainer.addArrangedSubview(profilNameLabel)
        addSubview(backgroundImageView)
        backgroundImageView.addSubview(cartImageView)
        backgroundImageView.addSubview(cartQuantityImageView)
        
        NSLayoutConstraint.activate([
            
            profilImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            profilImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            profilImageView.widthAnchor.constraint(equalToConstant: 50),
            profilImageView.heightAnchor.constraint(equalToConstant: 50),
            
            stackViewContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            stackViewContainer.leftAnchor.constraint(equalTo: profilImageView.rightAnchor, constant: 15),
            
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            backgroundImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            backgroundImageView.widthAnchor.constraint(equalToConstant: 50),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 50),
            
            cartImageView.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor),
            cartImageView.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            cartImageView.widthAnchor.constraint(equalToConstant: 30),
            cartImageView.heightAnchor.constraint(equalToConstant: 30),
            
            cartQuantityImageView.rightAnchor.constraint(equalTo: backgroundImageView.rightAnchor, constant: 13),
            cartQuantityImageView.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: -13),
            cartQuantityImageView.widthAnchor.constraint(equalToConstant: 30),
            cartQuantityImageView.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
}

extension TopView: TopViewModelDelegate {
    func updtateView(cartQuantity: Int) {
        if cartQuantity > 0 && cartQuantity <= 49{
            cartQuantityImageView.isHidden = false
            cartQuantityImageView.image = UIImage(systemName: "\(cartQuantity).circle.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        } else if cartQuantity > 49 {
            cartQuantityImageView.isHidden = false
            cartQuantityImageView.image = AppResource.tomuchInCartIcon.image
        }
        else {
            cartQuantityImageView.isHidden = true
        }
    }
}
