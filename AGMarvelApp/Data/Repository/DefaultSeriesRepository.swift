//
//  DefaultSeriesRepository.swift
//  AGMarvelApp
//
//  Created by Ana on 14/6/25.
//

final class SeriesRepository: SeriesRepositoryProtocol{
   
    private var network: NetworkSeriesProtocol
    
    init(network: NetworkSeriesProtocol = NetworkSeries()) {
        self.network = network
    }
    func getSeries(characterId: Int) async -> [Serie] {
        return await network.getSeries(characterId: characterId)
    }
}
// MARK: - Mock SeriesRepository

final class SeriesRepositoryMock: SeriesRepositoryProtocol{
   
    private var network: NetworkSeriesProtocol
    
    init(network: NetworkSeriesProtocol = NetworkSeriesMock()) {
        self.network = network
    }
    func getSeries(characterId: Int) async -> [Serie] {
        return await network.getSeries(characterId: characterId)
    }
}
