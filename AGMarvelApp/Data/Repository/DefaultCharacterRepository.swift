//
//  DefaultCharacterRepository.swift
//  AGMarvelApp
//
//  Created by Ana on 13/6/25.
//

final class CharacterRepository: CharacterRepositoryProtocol{
    private var network: NetworkCharactersProtocol
    
    init(network: NetworkCharactersProtocol = NetworkCharacters()) {
        self.network = network
    }
    
    func getCharacters() async -> [Character] {
        return await network.getCharacters()
    }
}

// MARK: - Mock CharacterRepository


final class CharacterRepositoryMock: CharacterRepositoryProtocol{
    private var network: NetworkCharactersProtocol
    
    init(network: NetworkCharactersProtocol = NetworkCharactersMock()) {
        self.network = network
    }
    
    func getCharacters() async -> [Character] {
        return await network.getCharacters()
    }
}
