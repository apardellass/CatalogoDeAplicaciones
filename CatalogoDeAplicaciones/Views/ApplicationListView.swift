//
//  ApplicationListView.swift
//  CatalogoDeAplicaciones
//
//  Created by Alberto Pardellas Soto on 28/5/22.
//

import SwiftUI

struct ApplicationListView: View {
    @EnvironmentObject var catalogueViewModel: CatalogueViewModel

    var body: some View {
        List {
            ForEach(self.catalogueViewModel.entries, id: \.id) { entry in
                if let image = entry.imImage?[0], let imName = entry.imName {
                    if let imageUrlString = image.label, let title = imName.label {
                        HStack(spacing: 16) {
                            AsyncImage(url: URL(string: imageUrlString))
                                .cornerRadius(10)
                            NavigationLink(title, destination: ApplicationDetailView(entry: entry))
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

struct ApplicationListView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationListView()
    }
}
