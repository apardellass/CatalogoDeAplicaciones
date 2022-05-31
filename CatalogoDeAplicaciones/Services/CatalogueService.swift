//
//  CatalogService.swift
//  CatalogoDeAplicaciones
//
//  Created by Alberto Pardellas Soto on 27/5/22.
//

import Foundation

class CatalogueService {
    func getCatalogue(completion: @escaping (Catalogue) -> Void) {
        guard let url = URL(string: "https://itunes.apple.com/es/rss/topfreeapplications/limit=20/json") else {
            print("Invalid url...")
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            do {
                let catalogue = try JSONDecoder().decode(Catalogue.self, from: data!)
                print(catalogue)

                DispatchQueue.main.async {
                    completion(catalogue)
                }
            } catch {
                print("Error decoding catalogue")
            }

        }.resume()
    }
}
