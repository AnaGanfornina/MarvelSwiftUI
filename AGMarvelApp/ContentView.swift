//
//  ContentView.swift
//  AGMarvelApp
//
//  Created by Ana on 12/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var characters: [Character] = []
    @State private var series: [Serie] = []

    var body: some View {
        VStack {
            
            List {
                
                ForEach(characters) { character in
                    Text(character.name)
                    
                    AsyncImage(url: URL(string: character.thumbnailURL)){ image in
                        image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 100, height: 100)
                    
                }
            }
            List {
                
                ForEach(series) { serie in
                    Text(serie.title)
                    
                    AsyncImage(url: URL(string: serie.thumbnailURL)){ image in
                        image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 100, height: 100)
                    
                    if let description = serie.description {
                        Text(description)
                    } else {
                        Text("Sin descripción")
                    }
                    
                }
            }

            
        }
        .onAppear {
            Task {
                characters = await CharacterUseCase().getCharacter()
                
                series = await SeriesUseCase().getSeries(characterId: 1009144)
            }
        }
    }
}


#Preview {
    ContentView()
}
