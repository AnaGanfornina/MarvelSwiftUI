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
        try super.setUpWithError(
            
        )
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
    }

    

}
 
