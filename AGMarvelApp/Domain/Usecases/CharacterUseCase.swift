//
//  CharacterUseCase.swift
//  AGMarvelApp
//
//  Created by Ana on 13/6/25.
//

import Foundation

// protocol

protocol CharacterUseCaseProtocol {
    var repo: CharacterRepositoryProtocol {get set}
    
    func getCharacter() async -> [Character] 
}

// MARK: - Use Case Character

final class CharacterUseCase: CharacterUseCaseProtocol {
    var repo: any CharacterRepositoryProtocol
    
    init(repo: any CharacterRepositoryProtocol = CharacterRepository()) {
        self.repo = repo
    }
    
    func getCharacter() async -> [Character] {
        return await repo.getCharacters()
    }
}

// MARK: - UseCase Character Mock

final class CharacterUseCaseMock: CharacterUseCaseProtocol {
    var repo: any CharacterRepositoryProtocol
    
    init(repo: any CharacterRepositoryProtocol = CharacterRepositoryMock()) {
        self.repo = repo
    }
    
    func getCharacter() async -> [Character] {
        return await repo.getCharacters()
    }
}
