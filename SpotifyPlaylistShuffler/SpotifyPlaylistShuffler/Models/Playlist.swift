//
//  Playlist.swift
//  SpotifyPlaylistShuffler
//
//  Created by Jan Stusio on 24/07/2024.
//

/// Represents a Spotify Playlist
struct Playlist: Identifiable, Codable {
    let id: String
    let name: String
    let tracks: [Song]
}
