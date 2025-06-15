//
//  SeriesUseCase.swift
//  AGMarvelApp
//
//  Created by Ana on 14/6/25.
//

// protocol

protocol SeriesUseCaseProtocol {
    var repo: SeriesRepositoryProtocol {get set}
    
    func getSeries(characterId: Int) async -> [Serie]
}

// MARK: - Use Case Series

final class SeriesUseCase: SeriesUseCaseProtocol {

    var repo: any SeriesRepositoryProtocol
    
    init(repo: any SeriesRepositoryProtocol = SeriesRepository()) {
        self.repo = repo
    }
    func getSeries(characterId: Int) async -> [Serie] {
        return await repo.getSeries(characterId: characterId)
    }
}
// MARK: - UseCase Series Mock

final class SeriesUseCaseMock: SeriesUseCaseProtocol {

    var repo: any SeriesRepositoryProtocol
    
    init(repo: any SeriesRepositoryProtocol = SeriesRepositoryMock()) {
        self.repo = repo
    }
    func getSeries(characterId: Int) async -> [Serie] {
        return await repo.getSeries(characterId: characterId)
    }
}
