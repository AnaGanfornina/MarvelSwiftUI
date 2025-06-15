//
//  Serie.swift
//  AGMarvelApp
//
//  Created by Ana on 12/6/25.
//

import Foundation

// MARK: - Serie

struct Serie: Codable, Identifiable{
    let id: Int
    let title: String
    let description: String?
    let photo: SeriesThumbnail // TODO: Puede que tenga que ser opcional
    //let character: Character
    
    enum CodingKeys: String, CodingKey {
            case id, title, description
            case photo = "thumbnail"
        }
    
    var thumbnailURL: String {
        return "\(photo.path).\(photo.extensionImage)"
        }

}

// MARK: - CharacterDataWrapper

struct SeriesDataWrapper: Codable{
    let data: DataSeriesContainer
}

// MARK: - DataCharacterContainer

/// It contains the information coming from the API.
struct DataSeriesContainer: Codable {
    let results: [Serie]
}

// MARK: - CharacterThumbnail
struct SeriesThumbnail: Codable {
    let path: String
    let extensionImage: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case extensionImage = "extension"
    }
}


