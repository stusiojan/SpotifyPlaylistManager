//
//  ConnectWithSptViewModel.swift
//  SpotifyPlaylistShuffler
//
//  Created by Jan Stusio on 24/07/2024.
//

import Combine
import Foundation

/// Handles the connection logic with Spotify
class ConnectWithSptViewModel: ObservableObject {
    @Published var isConnected: Bool = false
    @Published var showWebView: Bool = false
    @Published var authURL: URL?
    @Published var accessToken: Any?
    
    func connectToSpotify() {
        guard let urlRequest = SpotifyService.shared.getAccessTokenURL() else { return }
        self.authURL = urlRequest.url
        self.showWebView = true
    }
    
    func authorize() {
        if let token = UserDefaults.standard.value(forKey: "Authorization") {
            isConnected = true
            accessToken = token
        } else {
            connectToSpotify()
        }
    }
}

