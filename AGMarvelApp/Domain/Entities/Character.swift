//
//  Hero.swift
//  AGMarvelApp
//
//  Created by Ana on 12/6/25.
//
/*
 struct HeroDTO: Codable{
     
     let identifier: String
     let name : String
     let description: String
     let photo: String
     let favorite: Bool
     
     
     enum CodingKeys: String, CodingKey {
         case identifier = "id"
         case name
         case description
         case photo
         case favorite
     }
 }
 
 */

import Foundation

// MARK: - Hero

struct Character: Codable, Identifiable{
    let id: Int //TODO: Pasar a u uuid
    let name: String
    let description: String
    let photo: String
    //let series: Serie
}

// MARK: - Hero

/// It contains the information coming from the API.
struct dataCharacterContainer: Codable {
    let result: [Character]
}
