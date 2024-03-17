//
//  APIService.swift
//  EpicerieIkomobi
//
//  Created by Wassim on 15/03/2024.
//

import Foundation

protocol APIService {
    func fetchHomePageContent(completion: @escaping (Result<HomePageContent, CustomError>) -> Void)
}

