//
//  ApplicationsListView.swift
//  CatalogoDeAplicaciones
//
//  Created by Alberto Pardellas Soto on 28/5/22.
//

import SwiftUI

struct ApplicationsListView: View {
    @EnvironmentObject var catalogueViewModel: CatalogueViewModel

    var category: Category?

    var body: some View {
        List {
            ForEach(self.catalogueViewModel.entries, id: \.id) { entry in
                if let image = entry.imImage?[0], let imName = entry.imName {
                    if let imageUrlString = image.label, let title = imName.label {
                        HStack(spacing: 16) {
                            AsyncImage(url: URL(string: imageUrlString))
                                .cornerRadius(10)
                            Text(title)
                        }
                        .padding()
                    }
                }
            }
        }
        .navigationTitle(Text(category!.attributes!.label!))
        .onAppear {
            if let category = category {
                catalogueViewModel.getEntries(category: category)
            }
        }
    }
}

struct ApplicationsListView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationsListView()
    }
}
