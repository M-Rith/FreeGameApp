//
//  GameViewModel.swift
//  FreeToGame
//
//  Created by USER on 13/12/25.
//

import Foundation

@MainActor
final class GameViewModel: ObservableObject {
    @Published var games: [GameModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func load() async {
        isLoading = true
        errorMessage = nil

        do {
            games = try await FreeToGameAPI.shared.fetchGames()
        } catch {
            errorMessage = "Failed to load games: \(error)"
        }

        isLoading = false
    }
}
