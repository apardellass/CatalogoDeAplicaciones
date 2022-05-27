//
//  PurpleAttributes.swift
//  CatalogoDeAplicaciones
//
//  Created by Alberto Pardellas Soto on 27/5/22.
//

import Foundation

struct PurpleAttributes: Codable {
    let rel: Rel?
    let type: TypeEnum?
    let href: String?
    let title: Title?
    let imAssetType: IMAssetType?

    enum CodingKeys: String, CodingKey {
        case rel, type, href, title
        case imAssetType = "im:assetType"
    }
}
