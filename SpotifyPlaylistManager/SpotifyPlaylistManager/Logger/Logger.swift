//
//  Logger.swift
//  SpotifyPlaylistManager
//
//  Created by Jan Stusio on 18/07/2024.
//

import Foundation

class Logger {
    static let shared = Logger()
    
    private init() {}
    
    func log(_ message: String, level: LogLevel = .info) {
        let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .long)
        print("[\(timestamp)] [\(level.rawValue)] \(message)")
    }
    
    enum LogLevel: String {
        case info = "INFO"
        case warning = "WARNING"
        case error = "ERROR"
    }
}
