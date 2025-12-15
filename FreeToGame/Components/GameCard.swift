//
//  GameCard.swift
//  FreeToGame
//
//  Created by USER on 13/12/25.
//

import SwiftUI

struct GameCardView: View {
    
    let game: GameModel
    
    var body : some View {
        VStack {
            Text(game.title)
            Text(game.short_description)
        }.padding(.top, 20)
    }
}
