//
//  SptSongsViewModel.swift
//  SpotifyPlaylistShuffler
//
//  Created by Jan Stusio on 24/07/2024.
//

import Combine

/// Manages songs data within a playlist
class SptSongsViewModel: ObservableObject {
    @Published var songs: [Song] = []
    
    func fetchSongs(for playlistId: String) {
        // Implement logic to fetch songs from a specific playlist
    }
}

