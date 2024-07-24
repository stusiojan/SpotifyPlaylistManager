//
//  PlaybackViewModel.swift
//  SpotifyPlaylistShuffler
//
//  Created by Jan Stusio on 24/07/2024.
//

import Combine

/// Handles playback controls
class PlaybackViewModel: ObservableObject {
    @Published var currentSong: Song?
    @Published var isPlaying: Bool = false
    
    func play() {
        // Implement play logic
    }
    
    func pause() {
        // Implement pause logic
    }
    
    func next() {
        // Implement next song logic
    }
    
    func previous() {
        // Implement previous song logic
    }
}
