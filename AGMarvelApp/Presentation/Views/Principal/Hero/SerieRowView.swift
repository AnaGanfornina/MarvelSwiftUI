//
//  SerieRowView.swift
//  AGMarvelApp
//
//  Created by Ana on 15/6/25.
//

import SwiftUI

struct SerieRowView: View {
    var serie: Serie
    
    var body: some View {
        VStack{
            Text(serie.title)
                .font(.title)
                .bold()
                .padding(.leading, 10)
            
            AsyncImage(url: URL(string: serie.thumbnailURL)) { photo in
                photo
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .opacity(0.9)
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            Text(serie.description ?? "Sin descripción")
                .font(.body)
                .padding(.leading, 10)
           
        }
    }
}

#Preview {
    SerieRowView(serie: Serie(id: 1991, title: "Avengers (1963 - 1996)", description: "Avengers Assemble! Iron Man, Thor, Captain America and the rest of Earth's Mightiest Heroes unite to stand against the threats none can face alone! See the Avengers go up against Ultron, Kang, the Masters of Evil and more over three decades of epic action!", photo: SeriesThumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/9/10/519baa6d1890a", extensionImage: "jpg")))
}
