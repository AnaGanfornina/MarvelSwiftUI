//
//  FilmsViewModel.swift
//  AGMarvelApp
//
//  Created by Ana on 15/6/25.
//

import Foundation

@Observable
final class SeriesViewModel{
    var seriesData = [Serie]()
    
    private var useCaseSeries: SeriesUseCaseProtocol
    
    init(useCaseSeries: SeriesUseCaseProtocol = SeriesUseCase()) {
        self.useCaseSeries = useCaseSeries
    }
    
    @MainActor
    func getSeries(characterSelected: Int) async{
        let data = await useCaseSeries.getSeries(characterId: characterSelected)
        self.seriesData = data
    }
}
