//
//  CharacterUseCaseTest.swift
//  AGMarvelAppTests
//
//  Created by Ana on 15/6/25.
//

import XCTest

@testable import AGMarvelApp

final class CharacterUseCaseTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_CharacterUseCase_ReturnCharacter() async throws {
        // Given
        let sut = CharacterUseCase(repo: CharacterRepositoryMock())
        // When
        let expectedCharacter = await sut.getCharacter()
        let character = try XCTUnwrap(expectedCharacter.first)
        // Then
        XCTAssertEqual(character.name, "3-D Man")
        XCTAssertEqual(character.id, 1011334)
        let expectedDesc = ""
        XCTAssertEqual(character.description, expectedDesc)
        XCTAssertEqual(character.thumbnailURL, "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg")
    }
}
