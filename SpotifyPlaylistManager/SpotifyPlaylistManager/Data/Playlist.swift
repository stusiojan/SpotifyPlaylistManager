//
//  Playlist.swift
//  SpotifyPlaylistManager
//
//  Created by Jan Stusio on 18/07/2024.
//


struct Playlist: Identifiable, Codable {
    let id: String
    let name: String
    let uri: String
}
