//
//  CharapterView.swift
//  AGMarvelApp
//
//  Created by Ana on 13/6/25.
//

import SwiftUI

struct CharacterView: View {
    @State var viewModel: CharacterViewModel
    
    init(viewModel: CharacterViewModel = CharacterViewModel()){
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.characterData){ character in
                    NavigationLink{
                        // Destination
                        SeriesDetailView(characterSelected: character.id)
                        
                    } label: {
                        // Row
                        CharacterRowView(character: character)
                    }
                    
                }
            
            }//List
            .navigationTitle("Marvel characters ")
            .onAppear{
                Task{
                    await viewModel.getCharacter()
                }
            }
            
        }//Navigation
    }
}

#Preview {
    CharacterView()
}


