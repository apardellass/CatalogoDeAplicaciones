//
//  CatalogService.swift
//  CatalogoDeAplicaciones
//
//  Created by Alberto Pardellas Soto on 27/5/22.
//

import Foundation

class CatalogueService: ObservableObject {
    @Published var catalogue: Catalogue?

    func getCatalogue(completion: @escaping (Catalogue) -> ()) {
        guard let url = URL(string: "https://itunes.apple.com/es/rss/topfreeapplications/limit=20/json") else {
            print("Invalid url...")
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            let catalogue = try! JSONDecoder().decode(Catalogue.self, from: data!)
            print(catalogue)

            DispatchQueue.main.async {
                completion(catalogue)
            }
        }.resume()
    }
}