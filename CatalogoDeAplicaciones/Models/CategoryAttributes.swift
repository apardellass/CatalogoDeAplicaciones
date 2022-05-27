//
//  CategoryAttributes.swift
//  CatalogoDeAplicaciones
//
//  Created by Alberto Pardellas Soto on 27/5/22.
//

import Foundation

struct CategoryAttributes: Codable {
    let imID, term: String?
    let scheme: String?
    let label: String?

    enum CodingKeys: String, CodingKey {
        case imID = "im:id"
        case term, scheme, label
    }
}
