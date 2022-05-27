//
//  Feed.swift
//  CatalogoDeAplicaciones
//
//  Created by Alberto Pardellas Soto on 27/5/22.
//

import Foundation

struct Feed: Codable {
    let author: Author?
    let entry: [Entry]?
    let updated, rights, title, icon: Icon?
    let link: [FeedLink]?
    let id: Icon?
}
