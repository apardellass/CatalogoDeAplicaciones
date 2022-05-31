//
//  CatalogueServiceTest.swift
//  CatalogoDeAplicacionesTests
//
//  Created by Alberto Pardellas Soto on 31/5/22.
//

@testable import CatalogoDeAplicaciones
import XCTest

class CatalogueServiceTest: XCTestCase {
    func testGetCatalogueSuccess() {
        var catalogue: Catalogue?
        let catalogueExpectation = expectation(description: "catalogue")
        let urlString = "https://itunes.apple.com/es/rss/topfreeapplications/limit=20/json"

        CatalogueService().getCatalogue(urlString: urlString) { result in
            switch result {
            case .success(let cat): catalogue = cat
                catalogueExpectation.fulfill()
            default: break
            }
        }

        waitForExpectations(timeout: 5) { _ in
            XCTAssertNotNil(catalogue)
            XCTAssertEqual(catalogue?.feed?.entry?.count, 20)
        }
    }

    func testGetCatalogueError() {
        var catalogue: Catalogue?
        let catalogueExpectation = expectation(description: "catalogue")
        let urlString = "https://itunes.apple.co"

        CatalogueService().getCatalogue(urlString: urlString) { result in
            switch result {
            case .success(let cat): catalogue = cat
            default: break
            }

            catalogueExpectation.fulfill()
        }

        waitForExpectations(timeout: 5) { _ in
            XCTAssertNil(catalogue)
        }
    }
}
