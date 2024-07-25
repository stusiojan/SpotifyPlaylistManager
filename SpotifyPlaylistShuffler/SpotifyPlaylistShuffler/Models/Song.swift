//
//  Song.swift
//  SpotifyPlaylistShuffler
//
//  Created by Jan Stusio on 24/07/2024.
//

import Foundation

/// Represents a Spotify Song

struct TracksResponse: Codable {
    let href: String
    let items: [TrackItem]
    let limit: Int
    let next: String?
    let offset: Int
    let previous: String?
    let total: Int
}

struct TrackItem: Codable, Identifiable {
    let track: Song

    var id: String {
        return track.id
    }
}

struct Song: Identifiable, Codable {
    let id: String
    let name: String
    let album: Album
    let artists: [Artist]
    let externalUrls: ExternalUrls
    let href: String
    let durationMs: Int
    let uri: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case album
        case artists
        case externalUrls = "external_urls"
        case href
        case durationMs = "duration_ms"
        case uri
    }
}

struct Album: Codable {
    let id: String
    let name: String
    let images: [SptImage]?
}

struct Artist: Codable {
    let id: String
    let name: String
}

