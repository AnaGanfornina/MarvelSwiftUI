//
//  CharacterRepositoryProtocol.swift
//  AGMarvelApp
//
//  Created by Ana on 13/6/25.
//


//Las series también irian en este protocolo para evitar masive files
protocol CharacterRepositoryProtocol {
    func getCharacters() async -> [Character]
}
