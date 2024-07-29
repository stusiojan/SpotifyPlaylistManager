//
//  FilterViewModel.swift
//  SpotifyPlaylistShuffler
//
//  Created by Jan Stusio on 24/07/2024.
//

import Combine

/// Manages filtering logic for songs
class FilterViewModel: ObservableObject {
    @Published var filterCriteria: String = ""
    
    func filterSongs(_ songs: [Song]) -> [Song] {
        // Implement filtering logic based on criteria
        return songs.sorted(by: { $0.track.popularity > $1.track.popularity })
    }
}

