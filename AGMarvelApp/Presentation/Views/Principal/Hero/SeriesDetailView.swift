//
//  CharacterDetailView.swift
//  AGMarvelApp
//
//  Created by Ana on 15/6/25.
//

import SwiftUI

struct SeriesDetailView: View {
    var characterSelected: Int
    
    @State var viewModel: SeriesViewModel
    
    init(characterSelected: Int, viewModel: SeriesViewModel = SeriesViewModel()) {
        self.characterSelected = characterSelected
        self.viewModel = viewModel
    }
    
    var body: some View {
    
        VStack{
            List{
                ForEach(viewModel.seriesData){serie in
                    SerieRowView(serie: serie)
                    
                }
            }
            .onAppear{
                Task{
                    await viewModel.getSeries(characterSelected: characterSelected)
                }
            }
        }
    }
}

#Preview {
    SeriesDetailView(characterSelected: 1009144)
}
