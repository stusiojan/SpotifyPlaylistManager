//
//  SpotifyAuthManager.swift
//  SpotifyPlaylistManager
//
//  Created by Jan Stusio on 18/07/2024.
//

import SpotifyiOS

class SpotifyAuthManager: NSObject, ObservableObject {
    static let shared = SpotifyAuthManager()
    
    private let clientID: String
    private let redirectURI = URL(string: "spotify-ios-quick-start://spotify-login-callback")!
    
    private var sessionManager: SPTSessionManager?
    
    override private init() {
        if let clientID = ProcessInfo.processInfo.environment["SPOTIFY_CLIENT_ID"] {
            self.clientID = clientID
        } else {
            fatalError("SPOTIFY_CLIENT_ID is not set in the environment variables")
        }
        
        super.init()
        let configuration = SPTConfiguration(clientID: clientID, redirectURL: redirectURI)
        sessionManager = SPTSessionManager(configuration: configuration, delegate: self)
    }
    
    func initiateSession() {
        let scope: SPTScope = [.appRemoteControl, .userReadPlaybackState, .userModifyPlaybackState]
        sessionManager?.initiateSession(with: scope, options: .default, campaign: nil) //campaign?
    }
}

extension SpotifyAuthManager: SPTSessionManagerDelegate {
    func sessionManager(manager: SPTSessionManager, didInitiate session: SPTSession) {
        print("Successfully initiated session")
        // Handle successful login
    }
    
    func sessionManager(manager: SPTSessionManager, didFailWith error: Error) {
        print("Failed to initiate session: \(error.localizedDescription)")
    }
}
