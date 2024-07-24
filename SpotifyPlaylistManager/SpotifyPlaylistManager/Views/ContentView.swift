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
        NavigationStack {
            if authManager.isConnected {
                VStack {
                    if let image = authManager.artworkImage {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                    }
                    Text(authManager.trackName)
                        .font(.title)
                        .padding()
                    
                    Button(action: {
                        authManager.togglePlayPause()
                    }) {
                        Image(systemName: authManager.isPaused ? "play.fill" : "pause.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    .padding()
                    
                    Button(action: {
                        authManager.disconnectRemote()
                    }) {
                        Text("DISCONNECT")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(20)
                    }
                }
            } else {
                VStack {
                    Text("Connect your Spotify account")
                        .font(.headline)
                        .padding()
                    
                    Button(action: {
                        authManager.initiateSession()
                    }) {
                        Text("CONNECT")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(20)
                    }
                    NavigationLink("info") {
                        Info()
                    }
                }
            }
        }
        .onAppear {
//            Logger.shared.log("ContentView")
//            Logger.shared.log("I spotify installed: \(authManager.sessionManager.isSpotifyAppInstalled)")
//            Logger.shared.log("Is connected: \(authManager.isConnected)")
//            Logger.shared.log("Is Paused: \(authManager.isPaused)")
            authManager.connectRemote()
        }
    }
}

#Preview {
    ContentView()
}
