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


//struct Playlist: Identifiable, Decodable {
//    struct ExternalUrls: Decodable {
//        let spotify: String
//    }
//    
//    struct Followers: Decodable {
//        let href: String?
//        let total: Int
//    }
//    
//    struct Image: Decodable {
//        let url: String
//        let height: Int?
//        let width: Int?
//    }
//    
//    struct Owner: Decodable {
//        let externalUrls: ExternalUrls
//        let followers: Followers?
//        let href: String
//        let id: String
//        let type: String
//        let uri: String
//        let displayName: String
//        
//        enum CodingKeys: String, CodingKey {
//            case externalUrls = "external_urls"
//            case followers, href, id, type, uri
//            case displayName = "display_name"
//        }
//    }
//    
//    struct Track: Decodable {
//        let href: String
//        let limit: Int
//        let next: String?
//        let offset: Int
//        let previous: String?
//        let total: Int
//        let items: [Item]
//        
//        struct Item: Decodable {
//            let addedAt: String
//            let addedBy: User
//            let isLocal: Bool
//            let track: TrackDetail
//            
//            enum CodingKeys: String, CodingKey {
//                case addedAt = "added_at"
//                case addedBy = "added_by"
//                case isLocal = "is_local"
//                case track
//            }
//            
//            struct User: Decodable {
//                let externalUrls: ExternalUrls
//                let followers: Followers?
//                let href: String
//                let id: String
//                let type: String
//                let uri: String
//                
//                enum CodingKeys: String, CodingKey {
//                    case externalUrls = "external_urls"
//                    case followers, href, id, type, uri
//                }
//            }
//            
//            struct TrackDetail: Decodable {
//                let album: Album
//                let artists: [Artist]
//                let availableMarkets: [String]
//                let discNumber: Int
//                let durationMs: Int
//                let explicit: Bool
//                let externalIds: ExternalIds
//                let externalUrls: ExternalUrls
//                let href: String
//                let id: String
//                let isPlayable: Bool?
//                let linkedFrom: LinkedFrom?
//                let restrictions: Restrictions?
//                let name: String
//                let popularity: Int
//                let previewUrl: String?
//                let trackNumber: Int
//                let type: String
//                let uri: String
//                let isLocal: Bool
//                
//                enum CodingKeys: String, CodingKey {
//                    case album, artists
//                    case availableMarkets = "available_markets"
//                    case discNumber = "disc_number"
//                    case durationMs = "duration_ms"
//                    case explicit
//                    case externalIds = "external_ids"
//                    case externalUrls = "external_urls"
//                    case href, id
//                    case isPlayable = "is_playable"
//                    case linkedFrom = "linked_from"
//                    case restrictions, name, popularity
//                    case previewUrl = "preview_url"
//                    case trackNumber = "track_number"
//                    case type, uri
//                    case isLocal = "is_local"
//                }
//                
//                struct Album: Decodable {
//                    let albumType: String
//                    let totalTracks: Int
//                    let availableMarkets: [String]
//                    let externalUrls: ExternalUrls
//                    let href: String
//                    let id: String
//                    let images: [Image]
//                    let name: String
//                    let releaseDate: String
//                    let releaseDatePrecision: String
//                    let restrictions: Restrictions?
//                    let type: String
//                    let uri: String
//                    let artists: [Artist]
//                    
//                    enum CodingKeys: String, CodingKey {
//                        case albumType = "album_type"
//                        case totalTracks = "total_tracks"
//                        case availableMarkets = "available_markets"
//                        case externalUrls = "external_urls"
//                        case href, id, images, name
//                        case releaseDate = "release_date"
//                        case releaseDatePrecision = "release_date_precision"
//                        case restrictions, type, uri, artists
//                    }
//                }
//                
//                struct Artist: Decodable {
//                    let externalUrls: ExternalUrls
//                    let href: String
//                    let id: String
//                    let name: String
//                    let type: String
//                    let uri: String
//                    
//                    enum CodingKeys: String, CodingKey {
//                        case externalUrls = "external_urls"
//                        case href, id, name, type, uri
//                    }
//                }
//                
//                struct ExternalIds: Decodable {
//                    let isrc: String?
//                    let ean: String?
//                    let upc: String?
//                }
//                
//                struct LinkedFrom: Decodable {
//                    let externalUrls: ExternalUrls
//                    let href: String
//                    let id: String
//                    let type: String
//                    let uri: String
//                    
//                    enum CodingKeys: String, CodingKey {
//                        case externalUrls = "external_urls"
//                        case href, id, type, uri
//                    }
//                }
//                
//                struct Restrictions: Decodable {
//                    let reason: String
//                }
//            }
//        }
//    }
//    
//    let collaborative: Bool
//    let description: String
//    let externalUrls: ExternalUrls
//    let followers: Followers
//    let href: String
//    let id: String
//    let images: [Image]
//    let name: String
//    let owner: Owner
//    let isPublic: Bool?
//    let snapshotId: String
//    let tracks: Track
//    let type: String
//    let uri: String
//    
//    enum CodingKeys: String, CodingKey {
//        case collaborative, description
//        case externalUrls = "external_urls"
//        case followers, href, id, images, name, owner
//        case isPublic = "public"
//        case snapshotId = "snapshot_id"
//        case tracks, type, uri
//    }
//}
//
//struct PlaylistsResponse: Decodable {
//    let items: [Playlist]
//}
