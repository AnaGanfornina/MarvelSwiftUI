//
//  SeriesRepositoryProtocol.swift
//  AGMarvelApp
//
//  Created by Ana on 14/6/25.
//

protocol SeriesRepositoryProtocol {
    func getSeries(characterId: Int) async -> [Serie]
}
