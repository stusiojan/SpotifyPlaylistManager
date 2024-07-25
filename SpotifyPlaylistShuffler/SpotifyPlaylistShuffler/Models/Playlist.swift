//
//  Playlist.swift
//  SpotifyPlaylistShuffler
//
//  Created by Jan Stusio on 24/07/2024.
//

import Foundation



struct PlaylistsResponse: Codable {
    let href: String
    let limit: Int
    let next: String?
    let offset: Int
    let previous: String?
    let total: Int
    let items: [Playlist]
}

/// Represents a Spotify Playlist
struct Playlist: Identifiable, Codable {
    let collaborative: Bool
    let description: String?
    let externalUrls: ExternalUrls
    let href: String
    let id: String
    let images: [SptImage]?
    let name: String
    let owner: Owner
    let primaryColor: String?
    let isPublic: Bool?
    let snapshotId: String
    let tracks: Tracks
    let type: String
    let uri: String

    enum CodingKeys: String, CodingKey {
        case collaborative
        case description
        case externalUrls = "external_urls"
        case href
        case id
        case images
        case name
        case owner
        case primaryColor = "primary_color"
        case isPublic = "public"
        case snapshotId = "snapshot_id"
        case tracks
        case type
        case uri
    }
}

struct ExternalUrls: Codable {
    let spotify: String
}

struct SptImage: Codable {
    let height: Int?
    let url: String
    let width: Int?
}

struct Owner: Codable {
    let displayName: String
    let externalUrls: ExternalUrls
    let href: String
    let id: String
    let type: String
    let uri: String

    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case externalUrls = "external_urls"
        case href
        case id
        case type
        case uri
    }
}

struct Tracks: Codable {
    let href: String
    let total: Int
}
