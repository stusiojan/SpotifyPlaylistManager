//
//  Song.swift
//  SpotifyPlaylistShuffler
//
//  Created by Jan Stusio on 24/07/2024.
//

import Foundation

/// Represents a Spotify Song

import Foundation

// MARK: - ServerResponse
struct SongsResponse: Codable {
    let href: String
    let items: [Song]
    let limit: Int
    let next: String?
    let offset: Int
    let previous: String?
    let total: Int
}

// MARK: - Item
struct Song: Identifiable, Codable {
    var id: String {
        track.id
    }
    let addedAt: String
    let addedBy: AddedBy
    let isLocal: Bool
    let primaryColor: String?
    let track: Track
    let videoThumbnail: VideoThumbnail
    
    enum CodingKeys: String, CodingKey {
        case addedAt = "added_at"
        case addedBy = "added_by"
        case isLocal = "is_local"
        case primaryColor = "primary_color"
        case track
        case videoThumbnail = "video_thumbnail"
    }
}

// MARK: - AddedBy
struct AddedBy: Codable {
    let externalUrls: ExternalUrls
    let href: String
    let id: String
    let type: String
    let uri: String
    
    enum CodingKeys: String, CodingKey {
        case externalUrls = "external_urls"
        case href, id, type, uri
    }
}

// MARK: - Track
struct Track: Codable {
    let previewUrl: String?
    let availableMarkets: [String]
    let explicit: Bool
    let type: String
    let episode: Bool
    let track: Bool
    let album: Album
    let artists: [Artist]
    let discNumber, trackNumber, durationMs: Int
    let externalIds: ExternalIds
    let externalUrls: ExternalUrls
    let href: String
    let id: String
    let name: String
    let popularity: Int
    let uri: String
    let isLocal: Bool
    
    enum CodingKeys: String, CodingKey {
        case previewUrl = "preview_url"
        case availableMarkets = "available_markets"
        case explicit, type, episode, track, album, artists
        case discNumber = "disc_number"
        case trackNumber = "track_number"
        case durationMs = "duration_ms"
        case externalIds = "external_ids"
        case externalUrls = "external_urls"
        case href, id, name, popularity, uri
        case isLocal = "is_local"
    }
}

// MARK: - Album
struct Album: Codable {
    let availableMarkets: [String]
    let type, albumType, href, id: String
    let images: [SptImage]
    let name, releaseDate, releaseDatePrecision, uri: String
    let artists: [Artist]
    let externalUrls: ExternalUrls
    let totalTracks: Int
    
    enum CodingKeys: String, CodingKey {
        case availableMarkets = "available_markets"
        case type, albumType = "album_type", href, id, images, name, releaseDate = "release_date", releaseDatePrecision = "release_date_precision", uri, artists, externalUrls = "external_urls", totalTracks = "total_tracks"
    }
}

// MARK: - Artist
struct Artist: Codable {
    let externalUrls: ExternalUrls
    let href: String
    let id: String
    let name: String
    let type: String
    let uri: String
    
    enum CodingKeys: String, CodingKey {
        case externalUrls = "external_urls"
        case href, id, name, type, uri
    }
}

// MARK: - ExternalIds
struct ExternalIds: Codable {
    let isrc: String
}

// MARK: - VideoThumbnail
struct VideoThumbnail: Codable {
    let url: String?
}
