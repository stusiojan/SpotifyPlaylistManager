//
//  SptPlaylistViewModel.swift
//  SpotifyPlaylistShuffler
//
//  Created by Jan Stusio on 24/07/2024.
//

import Foundation

/// Manages playlists data
class SptPlaylistViewModel: ObservableObject {
    @Published var playlists: [Playlist] = []
    
    func fetchPlaylists() {
        SpotifyService.shared.fetchUserPlaylists { [weak self] playlists in
            DispatchQueue.main.async {
                self?.playlists = playlists
            }
        }
    }
}
