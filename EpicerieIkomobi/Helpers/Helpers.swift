//
//  CustomError.swift
//  EpicerieIkomobi
//
//  Created by Wassim on 15/03/2024.
//

import Foundation
import UIKit


class Helpers {
    
    static let shared = Helpers()
    private init() {}
    
     func loadImage(from url: URL, completion: @escaping (Result<UIImage, CustomError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(.networkError(error.localizedDescription)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.dataNotFound))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.wrongResponse))
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data)  {
                    completion(.success(image))
                } else {
                    completion(.failure(.wrongData))
                }
            }
        }.resume()
    }
}


