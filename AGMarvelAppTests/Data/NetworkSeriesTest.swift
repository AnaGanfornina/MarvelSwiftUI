//
//  NetworkSeriesTest.swift
//  AGMarvelAppTests
//
//  Created by Ana on 15/6/25.
//

import XCTest

@testable import AGMarvelApp
final class NetworkSeriesTest: XCTestCase {
    var sut: NetworkSeries!

    override func setUpWithError() throws {
        try super.setUpWithError()
            sut = NetworkSeries()
    }

    override func tearDownWithError() throws {
        try super.setUpWithError()
    }
    
    func test_getCharacters() async throws {
        // Given
        
        var expectedSeries:[Serie] = []
        let heroID = 1011334
        
        // When
        
        expectedSeries = await sut.getSeries(characterId: heroID)
        
        // Then
        
        XCTAssertEqual(expectedSeries.count, 3)
        let serie = try XCTUnwrap(expectedSeries.first)
        XCTAssertEqual(serie.title, "Avengers: The Initiative (2007 - 2010)")
        XCTAssertEqual(serie.id, 1945)
        XCTAssertEqual(serie.thumbnailURL, "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5.jpg")
        let expectedDesc: String? = nil
        XCTAssertEqual(serie.description, expectedDesc)
    }
}
