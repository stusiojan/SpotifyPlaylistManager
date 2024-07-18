//
//  ContentView.swift
//  SpotifyPlaylistManager
//
//  Created by Jan Stusio on 17/07/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var authManager = SpotifyAuthManager.shared
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Button("Login with Spotify") {
                authManager.initiateSession()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
