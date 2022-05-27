//
//  CatalogoDeAplicacionesApp.swift
//  CatalogoDeAplicaciones
//
//  Created by Alberto Pardellas Soto on 27/5/22.
//

import SwiftUI

@main
struct CatalogoDeAplicacionesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
