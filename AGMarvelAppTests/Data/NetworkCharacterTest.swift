//
//  NetworkCharacterTest.swift
//  AGMarvelAppTests
//
//  Created by Ana on 15/6/25.
//

import XCTest

@testable import AGMarvelApp

final class NetworkCharacterTest: XCTestCase {
    
    var sut: NetworkCharacters!

    override func setUpWithError() throws {
        try super.setUpWithError()
            sut = NetworkCharacters()
    }
    
    override func tearDownWithError() throws {
        try super.setUpWithError()
    }
    
    func test_getCharacters() async throws {
        // Given
        
        var expectedCharacters:[Character] = []
        
        // When
        
        expectedCharacters = await sut.getCharacters()
        
        // Then
        
        XCTAssertEqual(expectedCharacters.count, 20)
        let character = try XCTUnwrap(expectedCharacters.first)
        XCTAssertEqual(character.name, "3-D Man")
        XCTAssertEqual(character.id, 1011334)
        XCTAssertEqual(character.thumbnailURL, "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg")
        let expectedDesc = ""
        XCTAssertEqual(character.description, expectedDesc)
    }
}
