//
//  SptSongsViewModel.swift
//  SpotifyPlaylistShuffler
//
//  Created by Jan Stusio on 24/07/2024.
//

import Foundation
import Observation

/// Manages songs data within a playlist
@Observable
class SptSongsViewModel {
    var songs: [Song] = []
    
    func fetchSongs(for playlistId: String) {
        SpotifyService.shared.fetchSongs(for: playlistId) { [weak self] songs in
            DispatchQueue.main.async {
                self?.songs = songs
            }
        }
    }
}

