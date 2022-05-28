//
//  CategoriesListView.swift
//  CatalogoDeAplicaciones
//
//  Created by Alberto Pardellas Soto on 28/5/22.
//

import SwiftUI

struct CategoriesListView: View {
    @StateObject var catalogueViewModel: CatalogueViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(self.catalogueViewModel.categories, id: \.id) { category in
                    if let attributes = category.attributes {
                        if let label = attributes.label {
                            NavigationLink(label, destination: ApplicationsListView(category: category)
                                .environmentObject(catalogueViewModel))
                        }
                    }
                }
            }
            .navigationTitle(Text("Catálogo de Apps"))
        }
    }
}

struct CategoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesListView(catalogueViewModel: CatalogueViewModel())
    }
}
