//
//  CatalogueViewModel.swift
//  CatalogoDeAplicaciones
//
//  Created by Alberto Pardellas Soto on 28/5/22.
//

import Foundation

class CatalogueViewModel: ObservableObject {
    @Published var categories = [Category]()
    @Published var catalogue: Catalogue?

    fileprivate func getCatalogue() {
        CatalogueService().getCatalogue { catalogue in
            self.catalogue = catalogue

            if let feed = catalogue.feed {
                if let entries = feed.entry {
                    for entry in entries {
                        if let category = entry.category {
                            if !self.categories.contains(where: { $0.attributes?.label == category.attributes?.label }) {
                                self.categories.append(category)
                            }
                        }
                    }
                }
            }
        }
    }

    init() {
        getCatalogue()
    }
}
