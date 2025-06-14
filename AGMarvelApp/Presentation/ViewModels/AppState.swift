//
//  AppState.swift
//  AGMarvelApp
//
//  Created by Ana on 13/6/25.
//
import Foundation
//TODO: Creo qeu esto no hace falta porque no hay ningun login no?
@Observable
final class AppState{
    var status = Status.none

    private var charactersUserCase: CharacterUseCaseProtocol
    
    init( charactersUserCase: CharacterUseCaseProtocol) {
        self.charactersUserCase = charactersUserCase
    }
    
    func loginApp(){
        self.status = .loading
        
        
        
    }
    
}
