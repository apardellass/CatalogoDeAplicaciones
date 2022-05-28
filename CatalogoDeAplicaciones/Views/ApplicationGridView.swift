//
//  ApplicationGridView.swift
//  CatalogoDeAplicaciones
//
//  Created by Alberto Pardellas Soto on 28/5/22.
//

import SwiftUI

struct ApplicationGridView: View {
    @EnvironmentObject var catalogueViewModel: CatalogueViewModel

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        LazyVGrid(columns: columns, alignment: .center) {
            ForEach(self.catalogueViewModel.entries, id: \.id) { entry in
                if let image = entry.imImage?[1], let imName = entry.imName {
                    if let imageUrlString = image.label, let title = imName.label {
                        NavigationLink(
                            destination: ApplicationDetailView(entry: entry),
                            label: {
                                VStack(alignment: .center) {
                                    AsyncImage(url: URL(string: imageUrlString))
                                        .cornerRadius(15)
                                    Text(title)
                                        .frame(width: 120, height: 50)
                                        .multilineTextAlignment(.center)
                                }
                            }
                        )
                        .buttonStyle(PlainButtonStyle())
                        .padding()
                    }
                }
            }.padding()
        }
    }
}

struct ApplicationGridView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationGridView()
    }
}
