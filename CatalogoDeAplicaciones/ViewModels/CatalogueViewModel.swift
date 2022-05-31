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
    @Published var entries = [Entry]()
    @Published var isLoading = true
    @Published var showingAlert = false
    @Published var errorMessage = ""

    init() {
        self.isLoading = true
        getCatalogue()
    }

    func getCatalogue() {
        CatalogueService().getCatalogue { result in
            DispatchQueue.main.async {
                self.showingAlert = false
            }

            switch result {
            case .success(let catalogue):
                self.initCatalogue(catalogue: catalogue)

            case .failure(let error):
                self.handleError(networkError: error)
            }

            DispatchQueue.main.async {
                self.isLoading = false
            }
        }
    }

    func getEntries(category: Category) {
        if let feed = catalogue?.feed {
            if let entries = feed.entry {
                self.entries = entries.filter { $0.category?.attributes?.label == category.attributes?.label }
            }
        }
    }

    private func initCatalogue(catalogue: Catalogue) {
        self.catalogue = catalogue

        if let feed = catalogue.feed {
            if let entries = feed.entry {
                for entry in entries {
                    if let category = entry.category {
                        if !categories.contains(where: {
                            $0.attributes?.label == category.attributes?.label
                        }) {
                            categories.append(category)
                        }
                    }
                }
            }
        }
    }

    private func handleError(networkError: NetworkError) {
        DispatchQueue.main.async {
            switch networkError {
            case .transportError(let error):
                print(error)
                self.errorMessage = "Error en la conexión de red"
            case .serverError(let statusCode):
                print(statusCode)
                self.errorMessage = "Error del servidor"
            case .noData:
                self.errorMessage = "No hay datos de Apps disponibles"
            case .decodingError(let error):
                print(error)
                self.errorMessage = "Error al decodificar los datos"
            case .encodingError(let error):
                print(error)
                self.errorMessage = "Error al codificar los datos"
            }

            self.showingAlert = true
        }
    }
}
