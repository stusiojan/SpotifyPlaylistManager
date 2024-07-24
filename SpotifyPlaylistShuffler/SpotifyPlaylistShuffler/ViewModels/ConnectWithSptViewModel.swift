//
//  ConnectWithSptViewModel.swift
//  SpotifyPlaylistShuffler
//
//  Created by Jan Stusio on 24/07/2024.
//

import Combine

/// Handles the connection logic with Spotify
class ConnectWithSptViewModel: ObservableObject {
    @Published var isConnected: Bool = false
    
    func connectToSpotify() {
        // Implement Spotify authentication logic
    }
}

