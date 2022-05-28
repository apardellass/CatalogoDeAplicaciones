//
//  ApplicationDetailView.swift
//  CatalogoDeAplicaciones
//
//  Created by Alberto Pardellas Soto on 28/5/22.
//

import SwiftUI

struct ApplicationDetailView: View {
    var entry: Entry?

    var body: some View {
        if let entry = entry {
            if let image = entry.imImage?[2], let imName = entry.imName {
                if let imageUrlString = image.label, let title = imName.label {
                    ScrollView {
                        VStack(spacing: 16) {
                            AsyncImage(url: URL(string: imageUrlString))
                                .cornerRadius(20)

                            if let summary = entry.summary?.label {
                                Text(summary)
                            }
                        }
                        .padding()
                        Spacer()
                    }.navigationBarTitle(title, displayMode: .inline)
                }
            }
        }
    }
}

struct ApplicationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationDetailView()
    }
}
