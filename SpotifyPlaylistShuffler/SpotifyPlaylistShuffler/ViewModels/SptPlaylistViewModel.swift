//
//  SptPlaylistViewModel.swift
//  SpotifyPlaylistShuffler
//
//  Created by Jan Stusio on 24/07/2024.
//

import Combine

/// Manages playlists data
class SptPlaylistViewModel: ObservableObject {
    @Published var playlists: [Playlist] = []
    
    func fetchPlaylists() {
        // Implement logic to fetch playlists from Spotify API
    }
}
