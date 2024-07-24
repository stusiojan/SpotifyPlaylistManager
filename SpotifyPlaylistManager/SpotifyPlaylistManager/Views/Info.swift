//
//  Info.swift
//  SpotifyPlaylistManager
//
//  Created by Jan Stusio on 18/07/2024.
//

import SwiftUI

struct Info: View {
    @StateObject var authManager = SpotifyAuthManager.shared
    var body: some View {
        Text("Hello, World!")
            .foregroundStyle(.green)
            .padding()
            .onAppear {
//                Logger.shared.log("ContentView")
//                Logger.shared.log("I spotify installed: \(authManager.sessionManager.isSpotifyAppInstalled)")
//                Logger.shared.log("Is connected: \(authManager.isConnected)")
//                Logger.shared.log("Is Paused: \(authManager.isPaused)")
            }
    }
}

#Preview {
    Info()
}
