//
//  HomeViewController.swift
//  EpicerieIkomobi
//
//  Created by Wassim on 15/03/2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    var banner: Banner?
    
    var categories: [Category]? {
        didSet {
            self.categoriesView.collectionView.reloadData()
        }
    }
    
    var products: [Product]? {
        didSet {
            self.bestSellersView.collectionView.reloadData()
        }
    }
    
    let viewModel: HomeViewModel
    
    let categoryCollectionViewCellId = "categoryCollectionViewCellId"
    let bestSellersCollectionViewCellId = "bestSellersCollectionViewCellId"
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = AppStyle.primaryColor.color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        view.backgroundColor = AppStyle.primaryColor.color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let topView: TopView = {
        let view = TopView()
        view.backgroundColor = AppStyle.primaryColor.color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bannerView: BannerView = {
        let view = BannerView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let categoriesView: CategoriesView = {
        let view = CategoriesView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bestSellersView: BestSellersView = {
        let view = BestSellersView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchHomePageContent()
        setupCollectionViews()
        setupViews()
        
    }
    
    func setupViews() {
        
        view.addSubview(scrollView)
        view.addSubview(topView)
        
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubview(bannerView)
        scrollViewContainer.addArrangedSubview(categoriesView)
        scrollViewContainer.addArrangedSubview(bestSellersView)
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 130),
            
            scrollView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            bannerView.topAnchor.constraint(equalTo: scrollViewContainer.topAnchor, constant: 20),
            bannerView.centerXAnchor.constraint(equalTo: scrollViewContainer.centerXAnchor),
            bannerView.heightAnchor.constraint(equalToConstant: 160),
            
            categoriesView.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 20),
            categoriesView.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor),
            categoriesView.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor),
            categoriesView.heightAnchor.constraint(equalToConstant: 150),
            
            bestSellersView.topAnchor.constraint(equalTo: categoriesView.bottomAnchor, constant: 20),
            bestSellersView.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor),
            bestSellersView.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor),
            bestSellersView.heightAnchor.constraint(greaterThanOrEqualToConstant: 1020)
        ])
        
        scrollView.isScrollEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isDirectionalLockEnabled = true
    }
    
    func setupCollectionViews() {
        categoriesView.collectionView.dataSource = self
        categoriesView.collectionView.delegate = self
        categoriesView.collectionView.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: categoryCollectionViewCellId)
        
        bestSellersView.collectionView.dataSource = self
        bestSellersView.collectionView.delegate = self
        bestSellersView.collectionView.register(BestSellersCollectionViewCell.self, forCellWithReuseIdentifier: bestSellersCollectionViewCellId)
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func updateView(banner: Banner, categories: [Category], products: [Product]) {
        self.bannerView.bannerStringUrl = banner.image
        self.categories = categories
        self.products = products
    }
    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoriesView.collectionView {
            if let categories = categories { return categories.count} else {return 0 }
        } else {
            if let products = products { return products.count} else {return 0 }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == categoriesView.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCollectionViewCellId, for: indexPath) as! CategoriesCollectionViewCell
            if let categories = categories {
                cell.categorie = categories[indexPath.row]
            }
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bestSellersCollectionViewCellId, for: indexPath) as! BestSellersCollectionViewCell
            if let products = products {
                cell.product = products[indexPath.row]
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoriesView.collectionView {
            return CGSize(width: 80, height: 110)
        } else {
            return CGSize(width: (UIScreen.main.bounds.width/2)-25, height: 230)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == categoriesView.collectionView {
            return 10
        } else {
            return 17
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
}

