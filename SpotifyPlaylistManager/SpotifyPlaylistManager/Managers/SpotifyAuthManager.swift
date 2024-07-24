//
//  SpotifyAuthManager.swift
//  SpotifyPlaylistManager
//
//  Created by Jan Stusio on 18/07/2024.
//

class SpotifyAuthManager: NSObject, ObservableObject, SPTSessionManagerDelegate, SPTAppRemoteDelegate, SPTAppRemotePlayerStateDelegate {
    static let shared = SpotifyAuthManager()
    
    private let SpotifyClientID: String
    private let SpotifyRedirectURI = URL(string: "spotify-playlist-manager://spotify-login-callback")!
    
    @Published var isConnected: Bool = false
    @Published var trackName: String = ""
    @Published var artworkImage: UIImage? = nil
    @Published var isPaused: Bool = true
    
    private lazy var configuration: SPTConfiguration = {
        let configuration = SPTConfiguration(clientID: SpotifyClientID, redirectURL: SpotifyRedirectURI)
//        configuration.playURI = ""
        configuration.tokenSwapURL = URL(string: "spotify-playlist-manager://spotify-login-callback")
        configuration.tokenRefreshURL = URL(string: "spotify-playlist-manager://spotify-login-callback")
        Logger.shared.log("Configuration completed to URL: \(configuration.redirectURL)")
        return configuration
    }()
    
    lazy var sessionManager: SPTSessionManager = {
        let manager = SPTSessionManager(configuration: configuration, delegate: self)
        return manager
    }()
    
    private lazy var appRemote: SPTAppRemote = {
        let appRemote = SPTAppRemote(configuration: configuration, logLevel: .debug)
        appRemote.delegate = self
        return appRemote
    }()
    
    private var lastPlayerState: SPTAppRemotePlayerState?
    
    override private init() {
        if let SpotifyClientID = ProcessInfo.processInfo.environment["SPOTIFY_CLIENT_ID"] {
            self.SpotifyClientID = SpotifyClientID
        } else {
            fatalError("SPOTIFY_CLIENT_ID is not set in the environment variables")
        }
        super.init()
    }
    
    func initiateSession() {
        Logger.shared.log("Initiating session...")
        let scope: SPTScope = [.appRemoteControl, .playlistReadPrivate]
        sessionManager.initiateSession(with: scope, options: .clientOnly, campaign: nil)
    }
    
    func connectRemote() {
        Logger.shared.log("Connecting remote...")
        if let _ = appRemote.connectionParameters.accessToken {
            appRemote.connect()
            Logger.shared.log("Remote connected")
        } else {
            Logger.shared.log("Unable to connect, no accessToken")
        }
    }
    
    func disconnectRemote() {
        Logger.shared.log("Disconnecting remote...")
        if appRemote.isConnected {
            appRemote.disconnect()
            Logger.shared.log("Remote disconnected")
        }
    }
    
    func togglePlayPause() {
        if let lastPlayerState = lastPlayerState, lastPlayerState.isPaused {
            appRemote.playerAPI?.resume(nil)
            Logger.shared.log("Player resumed")
        } else {
            appRemote.playerAPI?.pause(nil)
            Logger.shared.log("Player paused")
        }
    }
    
    func sessionManager(manager: SPTSessionManager, didInitiate session: SPTSession) {
        appRemote.connectionParameters.accessToken = session.accessToken
        appRemote.connect()
        DispatchQueue.main.async {
            self.isConnected = true
        }
        Logger.shared.log("Authorization Success")
    }
    
    func sessionManager(manager: SPTSessionManager, didFailWith error: Error) {
        DispatchQueue.main.async {
            self.isConnected = false
        }
        Logger.shared.log("Authorization Failed: \(error.localizedDescription)", level: .error)
    }
    
    func appRemoteDidEstablishConnection(_ appRemote: SPTAppRemote) {
        Logger.shared.log("App established a connection with Spotify")
        isConnected = true
        appRemote.playerAPI?.delegate = self
        appRemote.playerAPI?.subscribe(toPlayerState: { (success, error) in
            if let error = error {
                Logger.shared.log("Error subscribing to player state: \(error.localizedDescription)", level: .error)
            }
        })
        fetchPlayerState()
    }
    
    func appRemote(_ appRemote: SPTAppRemote, didDisconnectWithError error: Error?) {
        Logger.shared.log("App don't established a connection with Spotify, error: \(String(describing: error))", level: .error)
        isConnected = false
        lastPlayerState = nil
    }
    
    func appRemote(_ appRemote: SPTAppRemote, didFailConnectionAttemptWithError error: Error?) {
        Logger.shared.log("App don't established a connection with Spotify, error: \(String(describing: error))", level: .error)
        isConnected = false
        lastPlayerState = nil
    }
    
    func playerStateDidChange(_ playerState: SPTAppRemotePlayerState) {
        Logger.shared.log("Updating player state ...")
        update(playerState: playerState)
    }
    
    private func update(playerState: SPTAppRemotePlayerState) {
        Logger.shared.log("Player state updated")
        if lastPlayerState?.track.uri != playerState.track.uri {
            fetchArtwork(for: playerState.track)
        }
        lastPlayerState = playerState
        trackName = playerState.track.name
        isPaused = playerState.isPaused
    }
    
    private func fetchArtwork(for track: SPTAppRemoteTrack) {
        Logger.shared.log("Fetching artwork...")
        appRemote.imageAPI?.fetchImage(forItem: track, with: CGSize.zero, callback: { [weak self] (image, error) in
            if let error = error {
                Logger.shared.log("Error fetching track image: \(error.localizedDescription)", level: .error)
            } else if let image = image as? UIImage {
                self?.artworkImage = image
            }
        })
    }
    
    private func fetchPlayerState() {
        Logger.shared.log("Fetching player state...")
        appRemote.playerAPI?.getPlayerState({ [weak self] (playerState, error) in
            if let error = error {
                Logger.shared.log("Error getting player state: \(error.localizedDescription)", level: .error)
            } else if let playerState = playerState as? SPTAppRemotePlayerState {
                self?.update(playerState: playerState)
            }
        })
    }
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        Logger.shared.log("T/F1")
        return sessionManager.application(application, open: url, options: options)
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        Logger.shared.log("T/F2")
        return sessionManager.application(application, continue: userActivity, restorationHandler: restorationHandler)
    }
}
