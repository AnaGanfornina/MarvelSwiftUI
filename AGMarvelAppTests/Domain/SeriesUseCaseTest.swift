//
//  SeriesUseCaseTest.swift
//  AGMarvelAppTests
//
//  Created by Ana on 15/6/25.
//

import XCTest
@testable import AGMarvelApp

final class SeriesUseCaseTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func test_SeriesUseCase_ReturnSerie() async throws {
        // Given
        let sut = SeriesUseCase(repo: SeriesRepositoryMock())
        let heroID = 1011334
        // When
        let expectedSerie = await sut.getSeries(characterId: heroID)
        let serie = try XCTUnwrap(expectedSerie.first)
        
        // Then
        XCTAssertEqual(serie.title, "Ant-Man & Wasp (2010 - 2011)")
        XCTAssertEqual(serie.id, 13082)
        XCTAssertEqual(serie.thumbnailURL, "http://i.annihil.us/u/prod/marvel/i/mg/3/60/4c606835416be.jpg")
        let expectedDesc: String? = nil
        XCTAssertEqual(serie.description, expectedDesc)
    }

}
