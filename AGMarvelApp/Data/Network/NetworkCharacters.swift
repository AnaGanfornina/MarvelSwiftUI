//
//  NetworkCharacters.swift
//  AGMarvelApp
//
//  Created by Ana on 13/6/25.
//

import Foundation

protocol NetworkCharactersProtocol{
    func getCharacters() async -> [Character]
}

final class NetworkCharacters: NetworkCharactersProtocol{
    func getCharacters() async -> [Character] {
        var modelReturn = [Character]()
        let urlCad: String = "\(ConstatsApp.CONST_API_URL)\(Endpoints.characters.rawValue)"
        var request = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HttpMethods.get
        request.addValue(HttpMethods.content, forHTTPHeaderField: "Content-type")
        
        
        // Call to server
         
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let resp = response as? HTTPURLResponse {
                if resp.statusCode == HttpResponseCodes.SUCCES {
                    //Decodifico
                    let decodedWrapper = try JSONDecoder().decode(CharacterDataWrapper.self, from: data)
                    modelReturn = decodedWrapper.data.results
                }
            }
            
        } catch {
            // TODO: Tratar Error...
            NSLog("\(error)Error al llamar a los characters")
        }
        return modelReturn
    }
}

// MARK: - Mock NetworkCharacter

final class NetworkCharactersMock: NetworkCharactersProtocol{
    func getCharacters() async -> [Character] {
        let model1 = Character(id: 1011334, name: "3-D Man", description:  "", photo: CharacterThumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extensionImage: "jpg"))
        
        let model2 = Character(id: 1017100, name: "A-Bomb (HAS)", description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ", photo: CharacterThumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16", extensionImage: "jpg"))
        
        return [model1,model2]
    }
}
