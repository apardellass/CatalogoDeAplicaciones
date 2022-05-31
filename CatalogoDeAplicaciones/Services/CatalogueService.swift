//
//  CatalogService.swift
//  CatalogoDeAplicaciones
//
//  Created by Alberto Pardellas Soto on 27/5/22.
//

import Foundation

class CatalogueService {
    func getCatalogue(urlString: String, completion: @escaping (Result<Catalogue, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            fatalError()
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let networkError = NetworkError(data: data, response: response, error: error) {
                completion(.failure(networkError))
            } else {
                do {
                    let catalogue = try JSONDecoder().decode(Catalogue.self, from: data!)
                    completion(.success(catalogue))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }.resume()
    }
}
