//
//  Decodable.swift
//  EpicerieIkomobi
//
//  Created by Wassim on 15/03/2024.
//

import Foundation

struct HomePageContent: Codable {
    let banner: Banner
    let categories: [Category]
    let products: [Product]
}

struct Banner: Codable {
    let image: String
}

struct Category: Codable {
    let id: Int
    let name: String
    let image: String
}


struct Product: Codable {
    let id: Int
    let name: String
    let price: Double
    let image: String
    let packaging: Packaging
}

struct Packaging: Codable {
    let unit: String
    let measure: Double
}
