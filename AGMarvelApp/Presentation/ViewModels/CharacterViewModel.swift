//
//  CharapterVM.swift
//  AGMarvelApp
//
//  Created by Ana on 13/6/25.
//

import Foundation

@Observable
final class CharacterViewModel{
    var characterData = [Character]()
    
    private var useCaseCharacter: CharacterUseCaseProtocol
    
    init(useCase: CharacterUseCaseProtocol = CharacterUseCase()) {
        self.useCaseCharacter = useCase
    }
    
    @MainActor
    func getCharacter() async {
        let data = await useCaseCharacter.getCharacter()
        self.characterData = data
    }
}
