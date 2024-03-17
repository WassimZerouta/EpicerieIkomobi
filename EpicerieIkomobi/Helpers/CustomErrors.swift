//
//  CustomErrors.swift
//  EpicerieIkomobi
//
//  Created by Wassim on 16/03/2024.
//

import Foundation

enum CustomError: Error {
    case invalidURL
    case dataNotFound
    case networkError(String)
    case wrongResponse
    case jsonDecodingError(String)
    case wrongData
}
