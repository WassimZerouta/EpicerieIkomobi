//
//  HomeViewModel.swift
//  EpicerieIkomobi
//
//  Created by Wassim on 15/03/2024.
//

import Foundation

class HomeViewModel {
    
    var banner: Banner?
    var categories: [Category]?
    var products: [Product]?
        
    private let APIService: APIService
    weak var delegate: HomeViewModelDelegate?
    
    init(APIService: APIService) {
        self.APIService = APIService
    }
    
    func fetchHomePageContent() {
        APIService.fetchHomePageContent { [self] result in
            switch result {
                
            case .success(let content):
                    delegate?.updateView(banner: content.banner, categories: content.categories, products: content.products)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
