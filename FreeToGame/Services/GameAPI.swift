//
//  GameAPI.swift
//  FreeToGame
//
//  Created by USER on 13/12/25.
//


import Foundation

enum APIError: Error {
    case invalidURL
    case badStatus(Int)
    case decoding(Error)
}

final class FreeToGameAPI {
    static let shared = FreeToGameAPI()
    private init() {}

    private let baseURL = "https://www.freetogame.com/api"

    func fetchGames() async throws -> [GameModel] {
        guard let url = URL(string: "\(baseURL)/games") else {
            throw APIError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        if let http = response as? HTTPURLResponse, !(200...299).contains(http.statusCode) {
            throw APIError.badStatus(http.statusCode)
        }

        do {
            return try JSONDecoder().decode([GameModel].self, from: data)
        } catch {
            throw APIError.decoding(error)
        }
    }
}
