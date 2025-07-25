//
//  CharacterRowView.swift
//  AGMarvelApp
//
//  Created by Ana on 14/6/25.
//

import SwiftUI

struct CharacterRowView: View {
    var character: Character
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: character.thumbnailURL)) { photo in
                photo
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .opacity(0.9)
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            Text(character.name)
                .font(.title)
                .bold()
                .padding(.leading, 10)
        }
    }
}
#Preview {
    CharacterRowView(character: Character(id: 1017100, name: "A-Bomb (HAS)", description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ", photo: CharacterThumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16", extensionImage: "jpg")))
}
