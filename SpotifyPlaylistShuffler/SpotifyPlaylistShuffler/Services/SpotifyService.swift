//
//  SpotifyService.swift
//  SpotifyPlaylistShuffler
//
//  Created by Jan Stusio on 24/07/2024.
//

import Foundation

/// Handles network calls to Spotify API
class SpotifyService {
    static let shared = SpotifyService()
    
    func fetchUserPlaylists(completion: @escaping ([Playlist]) -> Void) {
        // Implement network request to fetch user playlists
    }
    
    func fetchSongs(for playlistId: String, completion: @escaping ([Song]) -> Void) {
        // Implement network request to fetch songs in a playlist
    }
}
