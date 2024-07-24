//
//  Extensions.swift
//  SpotifyPlaylistShuffler
//
//  Created by Jan Stusio on 24/07/2024.
//

import SwiftUI

/// Extensions for URLSession or other utilities
extension URLSession {
    func dataTaskPublisher(for url: URL) -> URLSession.DataTaskPublisher {
        return dataTaskPublisher(for: URLRequest(url: url))
    }
}
