//
//  Song.swift
//  SpotifyPlaylistShuffler
//
//  Created by Jan Stusio on 24/07/2024.
//

import Foundation

/// Represents a Spotify Song
struct Song: Identifiable, Codable {
    let id: String
    let name: String
    let artist: String
    let album: String
    let genre: String?
    let albumCoverUrl: String //URL
}
