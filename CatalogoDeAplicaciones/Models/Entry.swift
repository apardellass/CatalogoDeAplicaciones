//
//  Entry.swift
//  CatalogoDeAplicaciones
//
//  Created by Alberto Pardellas Soto on 27/5/22.
//

import Foundation

struct Entry: Codable, Identifiable {
    let id = UUID()
    let imName: Icon?
    let imImage: [IMImage]?
    let summary: Icon?
    let imPrice: IMPrice?
    let imContentType: IMContentType?
    let rights, title: Icon?
    let link: [EntryLink]?
    // let id: ID?
    let imArtist: IMArtist?
    let category: Category?
    let imReleaseDate: IMReleaseDate?

    enum CodingKeys: String, CodingKey {
        case imName = "im:name"
        case imImage = "im:image"
        case summary
        case imPrice = "im:price"
        case imContentType = "im:contentType"
        case rights, title, link
        case imArtist = "im:artist"
        case category
        case imReleaseDate = "im:releaseDate"
    }
}
