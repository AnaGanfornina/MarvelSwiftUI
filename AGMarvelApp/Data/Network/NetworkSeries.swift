//
//  NetworkSeries.swift
//  AGMarvelApp
//
//  Created by Ana on 14/6/25.
//

import Foundation

protocol NetworkSeriesProtocol{
    func getSeries(characterId: Int) async -> [Serie]
}

final class NetworkSeries: NetworkSeriesProtocol{
    func getSeries(characterId: Int) async -> [Serie] {
        var modelReturn = [Serie]()
        let urlCad: String = "\(ConstatsApp.CONST_API_URL)\(Endpoints.series.rawValue)&characters=\(characterId)"
        var request = URLRequest(url: URL(string: urlCad)!)
        request.httpMethod = HttpMethods.get
        request.addValue(HttpMethods.content, forHTTPHeaderField: "Content-type")
        
        
        // Call to server
         
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let resp = response as? HTTPURLResponse {
                if resp.statusCode == HttpResponseCodes.SUCCES {
                    //Decodifico
                    let decodedWrapper = try JSONDecoder().decode(SeriesDataWrapper.self, from: data)
                    modelReturn = decodedWrapper.data.results
                }
            }
            
        } catch {
            // TODO: Tratar Error...
            NSLog("\(error)Error al llamar a las series")
        }
        return modelReturn
    }
}
// MARK: - Mock NetworkSeries


final class NetworkSeriesMock: NetworkSeriesProtocol{
    func getSeries(characterId: Int) async -> [Serie] {
        let model1 = Serie(id: 13082, title: "Ant-Man & Wasp (2010 - 2011)", description: nil, photo: SeriesThumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/60/4c606835416be", extensionImage: "jpg"))
        
        let model2 = Serie(id: 1991, title: "Avengers (1963 - 1996)", description: "Avengers Assemble! Iron Man, Thor, Captain America and the rest of Earth's Mightiest Heroes unite to stand against the threats none can face alone! See the Avengers go up against Ultron, Kang, the Masters of Evil and more over three decades of epic action!", photo: SeriesThumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/9/10/519baa6d1890a", extensionImage: "jpg"))
        
        return [model1, model2]
    }
}
