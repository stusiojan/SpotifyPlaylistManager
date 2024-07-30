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
    
    private let clientId: String
    private let clientSecret: String
    private let apiHost: String = "api.spotify.com"
    private let authHost: String = "accounts.spotify.com"
    private let redirectUri: String = "https://www.google.com"
    private let responseType: String = "token"
    private let scopes: [String] = [
        // Playback
        "app-remote-control",
        // Spotify Connect
        "user-read-playback-state",
        "user-modify-playback-state",
        "user-read-currently-playing",
        // Playlists
        "playlist-read-private",
        "playlist-read-collaborative",
        "playlist-modify-private",
        "playlist-modify-public",
        // Library
        "user-library-modify",
        "user-library-read",
        // Follow
        // Listening History
    ]
    
    private var authParams: [String:String]
    
    private init() {
        if let clientId = ProcessInfo.processInfo.environment["CLIENT_ID"] {
            self.clientId = clientId
        } else {
            clientId = "no clientId"
            Logger.shared.log("CLIENT_ID is not set in the environment variables", level: .error)
        }
        
        if let clientSecret = ProcessInfo.processInfo.environment["CLIENT_SECRET"] {
            self.clientSecret = clientSecret
        } else {
            clientSecret = "no clientSecret"
            Logger.shared.log("CLIENT_SECRET is not set in the environment variables", level: .error)
        }
        
        authParams = [
            "response_type": responseType,
            "client_id": clientId,
            "redirect_uri": redirectUri,
            "scope": scopes.joined(separator: " ")
        ]
    }
    
    func getAccessTokenURL() -> URLRequest? {
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = authHost
        components.path = "/authorize"
        
        components.queryItems = authParams.map({
            URLQueryItem(
                name: $0,
                value: $1)
        })
        
        guard let url = components.url else { return nil }
        
        return URLRequest(url: url)
    }
    
    func fetchUserPlaylists(completion: @escaping ([Playlist]) -> Void) {
        guard let accessToken = UserDefaults.standard.value(forKey: "Authorization") as? String else {
            Logger.shared.log("Access token not available", level: .error)
            completion([])
            return
        }
        
        var request = URLRequest(url: URL(string: "https://\(apiHost)/v1/me/playlists")!)
        request.httpMethod = "GET"
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                Logger.shared.log("Failed to fetch playlists: \(error?.localizedDescription ?? "Unknown error")", level: .error)
                completion([])
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let playlistsResponse = try decoder.decode(PlaylistsResponse.self, from: data)
                completion(playlistsResponse.items)
            } catch {
                Logger.shared.log("Failed to decode playlists: \(error.localizedDescription)", level: .error)
                if let decodingError = error as? DecodingError {
                    switch decodingError {
                    case .dataCorrupted(let context):
                        Logger.shared.log("Data corrupted: \(context.debugDescription)", level: .error)
                    case .keyNotFound(let key, let context):
                        Logger.shared.log("Key not found: \(key.stringValue) in \(context.debugDescription)", level: .error)
                    case .typeMismatch(let type, let context):
                        Logger.shared.log("Type mismatch: \(type) in \(context.debugDescription)", level: .error)
                    case .valueNotFound(let type, let context):
                        Logger.shared.log("Value not found: \(type) in \(context.debugDescription)", level: .error)
                    @unknown default:
                        Logger.shared.log("Unknown decoding error", level: .error)
                    }
                }
                completion([])
            }
        }.resume()
    }


    func fetchSongs(for playlistId: String, completion: @escaping ([Song]) -> Void) {
        guard let accessToken = UserDefaults.standard.value(forKey: "Authorization") as? String else {
            Logger.shared.log("Access token not available", level: .error)
            completion([])
            return
        }

        let urlString = "https://\(apiHost)/v1/playlists/\(playlistId)/tracks"
        guard let url = URL(string: urlString) else {
            Logger.shared.log("Invalid URL: \(urlString)", level: .error)
            completion([])
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                Logger.shared.log("Failed to fetch songs: \(error?.localizedDescription ?? "Unknown error")", level: .error)
                completion([])
                return
            }

            do {
                let decoder = JSONDecoder()
                let tracksResponse = try decoder.decode(SongsResponse.self, from: data)
                let songs = tracksResponse.items.map { $0 }
                completion(songs)
            } catch {
                Logger.shared.log("Failed to decode songs: \(error.localizedDescription)", level: .error)
                if let decodingError = error as? DecodingError {
                    switch decodingError {
                    case .dataCorrupted(let context):
                        Logger.shared.log("Data corrupted: \(context.debugDescription)", level: .error)
                    case .keyNotFound(let key, let context):
                        Logger.shared.log("Key not found: \(key.stringValue) in \(context.debugDescription)", level: .error)
                    case .typeMismatch(let type, let context):
                        Logger.shared.log("Type mismatch: \(type) in \(context.debugDescription)", level: .error)
                    case .valueNotFound(let type, let context):
                        Logger.shared.log("Value not found: \(type) in \(context.debugDescription)", level: .error)
                    @unknown default:
                        Logger.shared.log("Unknown decoding error", level: .error)
                    }
                }
                completion([])
            }
        }.resume()
    }

}
