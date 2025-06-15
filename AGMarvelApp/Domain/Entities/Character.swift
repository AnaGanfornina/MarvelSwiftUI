//
//  Hero.swift
//  AGMarvelApp
//
//  Created by Ana on 12/6/25.
//


import Foundation

// MARK: - Character

struct Character: Codable, Identifiable{
    let id: Int
    let name: String
    let description: String
    let photo: CharacterThumbnail
    //let series: Serie
    
    enum CodingKeys: String, CodingKey {
            case id, name, description
            case photo = "thumbnail"
        }
    
    var thumbnailURL: String {
        let _ = photo.path
        return "\(photo.path).\(photo.extensionImage)"
        }

}

// MARK: - CharacterDataWrapper

struct CharacterDataWrapper: Codable{
    let data: DataCharacterContainer
}

// MARK: - DataCharacterContainer

/// It contains the information coming from the API.
struct DataCharacterContainer: Codable {
    let results: [Character]
}

// MARK: - CharacterThumbnail
struct CharacterThumbnail: Codable {
    let path: String
    let extensionImage: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case extensionImage = "extension"
    }
}



