//
//  EpicerieIkomobiTests.swift
//  EpicerieIkomobiTests
//
//  Created by Wassim on 15/03/2024.
//

import XCTest
@testable import EpicerieIkomobi

final class EpicerieIkomobiTests: XCTestCase {
    
    private var viewmodel: HomeViewModel!
    private var APIService: MockAPIManager!
    private var delegate: MockHomeViewController!
    
    override func setUpWithError() throws {
        APIService = MockAPIManager()
        viewmodel = HomeViewModel(APIService: APIService)
        delegate = MockHomeViewController()
        viewmodel.delegate = delegate
    }

    override func tearDownWithError() throws {
        APIService = nil
        viewmodel = nil
    }

    func testSuccess() throws {
        let homePageContent = HomePageContent(banner: Banner(image: ""), categories: [Category(id: 1, name: "Fruits", image: "")], products: [Product(id: 1, name: "Orange", price: 2.0, image: "", packaging: Packaging(unit: "kg", measure: 2.0))])
        
        APIService.mockResult = .success(homePageContent)
        viewmodel.fetchHomePageContent()

        XCTAssertEqual(delegate.updateViewArray[0].categories[0].name, "Fruits")
    }
    
    func testFailure() throws {
        APIService.mockResult = .failure(.dataNotFound)
        viewmodel.fetchHomePageContent()
        
        XCTAssertEqual(delegate.updateViewArray.count, 0)
    }
}

class MockAPIManager: APIService {
    var mockResult: Result<EpicerieIkomobi.HomePageContent, EpicerieIkomobi.CustomError>?
    
    func fetchHomePageContent(completion: @escaping (Result<EpicerieIkomobi.HomePageContent, EpicerieIkomobi.CustomError>) -> Void) {
        if let result = mockResult {
            completion(result)
        }
    }
}

class MockHomeViewController: HomeViewModelDelegate {
    public var updateViewArray: [HomePageContent] = []
    
    func updateView(banner: EpicerieIkomobi.Banner, categories: [EpicerieIkomobi.Category], products: [EpicerieIkomobi.Product]) {
        updateViewArray.append(HomePageContent(banner: banner, categories: categories, products: products))
    } 
}
