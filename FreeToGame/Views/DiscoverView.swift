//
//  DiscoverView.swift
//  FreeToGame
//
//  Created by USER on 9/12/25.
//


import SwiftUI

struct DiscoverView : View {
    
    @StateObject private var vm = GameViewModel()
    
    var body: some View {
            NavigationStack {
                Group {
                    if vm.isLoading && vm.games.isEmpty {
                        ProgressView("Loading games...")
                    } else if let msg = vm.errorMessage {
                        VStack(spacing: 12) {
                            Text(msg).font(.caption)
                            Button("Retry") { Task { await vm.load() } }
                        }
                    }
                    else {
                        List(vm.games) { game in
                            Text(game.title)
                        }
                        
                    }
                }.task {
                    if vm.games.isEmpty { await vm.load() }
                }
                .navigationTitle("GamerPower")
                .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    DiscoverView()
}
