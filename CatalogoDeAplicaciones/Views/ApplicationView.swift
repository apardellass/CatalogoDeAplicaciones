//
//  ApplicationsListView.swift
//  CatalogoDeAplicaciones
//
//  Created by Alberto Pardellas Soto on 28/5/22.
//

import SwiftUI

struct ApplicationView: View {
    @EnvironmentObject var catalogueViewModel: CatalogueViewModel

    var category: Category?

    var body: some View {
        VStack {
            if UIDevice.current.userInterfaceIdiom == .pad {
                ApplicationGridView().environmentObject(catalogueViewModel)
                Spacer()
            } else {
                ApplicationListView().environmentObject(catalogueViewModel)
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
        ApplicationView()
    }
}
