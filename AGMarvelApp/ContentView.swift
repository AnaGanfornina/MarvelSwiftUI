//
//  ContentView.swift
//  AGMarvelApp
//
//  Created by Ana on 12/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var characters: [Character] = []

    var body: some View {
        VStack {
            
            List {
                ForEach(characters) { character in
                    Text(character.name)
                    /*
                    AsyncImage(url: URL(string: character.photo)){ photo in
                        photo
                    }*/
                    
                }
            }

            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
        }
        .onAppear {
            Task {
                characters = await CharacterUseCase().getCharacter()
            }
        }
    }
}


#Preview {
    ContentView()
}
