//
//  ContentView.swift
//  CatalogoDeAplicaciones
//
//  Created by Alberto Pardellas Soto on 27/5/22.
//

import CoreData
import SwiftUI

struct ContentView: View {
    var body: some View {
        CategoriesListView(catalogueViewModel: CatalogueViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
