//
//  ConnectWithSptView.swift
//  SpotifyPlaylistShuffler
//
//  Created by Jan Stusio on 24/07/2024.
//

import SwiftUI

/// View for connecting with Spotify
struct ConnectWithSptView: View {
    @StateObject var viewModel = ConnectWithSptViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isConnected {
                Text("Connected to Spotify")
            } else {
                Button("Connect") {
                    viewModel.connectToSpotify()
                }
            }
        }
    }
}


#Preview {
    ConnectWithSptView()
}
