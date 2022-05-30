//
//  ApplicationDetailView.swift
//  CatalogoDeAplicaciones
//
//  Created by Alberto Pardellas Soto on 28/5/22.
//

import SwiftUI

struct ApplicationDetailView: View {
    @Environment(\.openURL) var openURL

    var entry: Entry?

    var body: some View {
        if let entry = entry {
            if let image = entry.imImage?[2], let imName = entry.imName {
                if let imageUrlString = image.label, let title = imName.label {
                    ScrollView {
                        VStack(spacing: 16) {
                            AsyncImage(url: URL(string: imageUrlString))
                                .cornerRadius(20)

                            Text(title)
                                .font(.title)
                                .multilineTextAlignment(.center)

                            if let rights = entry.rights?.label {
                                Text(rights)
                                    .font(.title3)
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.center)
                            }

                            Divider()

                            if let summary = entry.summary?.label {
                                Text(summary)
                            }

                            Divider()

                            if let link = entry.link?[0].attributes?.href {
                                if let url = URL(string: link
                                    .replacingOccurrences(of: "https", with: "itms")
                                    .replacingOccurrences(of: "apps", with: "itunes"))
                                {
                                    Button("Abrir en el App Store") {
                                        openURL(url)
                                    }
                                }
                            }
                        }
                        .padding()

                        Spacer()
                    }
                    .navigationBarTitleDisplayMode(.inline)
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
