//
//  CategoriesListView.swift
//  CatalogoDeAplicaciones
//
//  Created by Alberto Pardellas Soto on 28/5/22.
//

import SwiftUI

struct CategoriesListView: View {
    @State var categories = [Category]()
    @State var catalogue: Catalogue?

    var body: some View {
        NavigationView {
            List {
                ForEach(categories, id: \.id) { category in
                    if let attributes = category.attributes {
                        if let label = attributes.label {
                            NavigationLink(label, destination: ApplicationsListView())
                        }
                    }
                }
            }
            .navigationTitle(Text("Catálogo de Apps"))
            .onAppear {
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
        }
    }
}

struct CategoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesListView()
    }
}
