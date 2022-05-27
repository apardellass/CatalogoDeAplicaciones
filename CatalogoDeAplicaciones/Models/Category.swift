//
//  Category.swift
//  CatalogoDeAplicaciones
//
//  Created by Alberto Pardellas Soto on 27/5/22.
//

import Foundation

struct Category: Codable, Identifiable {
    var id = UUID()
    let attributes: CategoryAttributes?

    enum CodingKeys: String, CodingKey {
        case attributes
    }
}
