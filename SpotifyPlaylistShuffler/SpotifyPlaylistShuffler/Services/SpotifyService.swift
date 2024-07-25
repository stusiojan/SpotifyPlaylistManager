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
        guard let accessToken = UserDefaults.standard.value(forKey: "Authorization") else {
            Logger.shared.log("Access token not available", level: .error)
            completion([])
            return
        }
        
        var request = URLRequest(url: URL(string: "https://\(apiHost)/v1/me/playlists")!)
            request.httpMethod = "GET"
            request.addValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
//                guard error == nil else {
//                    Logger.shared.log("Error fetching playlists: \(error!.localizedDescription)", level: .error)
//                    completion([])
//                    return
//                }
//                
//                guard let data = data else {
//                    Logger.shared.log("No data received", level: .error)
//                    completion([])
//                    return
//                }
//                
//                do {
//                    let playlistsResponse = try JSONDecoder().decode(PlaylistsResponse.self, from: data)
//                    completion(playlistsResponse.items)
//                } catch {
//                    Logger.shared.log("Error decoding playlists: \(error.localizedDescription)", level: .error)
//                    completion([])
//                }
            }
            
            task.resume()
        }
    
    func fetchSongs(for playlistId: String, completion: @escaping ([Song]) -> Void) {
        // Implement network request to fetch songs in a playlist
    }
}
