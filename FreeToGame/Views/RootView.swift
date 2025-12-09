//
//  RootView.swift
//  FreeToGame
//
//  Created by USER on 9/12/25.
//


import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            NavigationStack {
                DiscoverView()
            }
            .tabItem {
                Label("Discover", systemImage: "safari.fill")
            }
            NavigationStack {
                FavoriteView()
            }
            .tabItem {
                Label("Favorite", systemImage: "heart.fill")
            }
            NavigationStack {
                SettingView()
            }
            .tabItem {
                Label("Setting", systemImage: "gearshape.fill")
            }
        }
    }
}

#Preview {
    RootView()
}
