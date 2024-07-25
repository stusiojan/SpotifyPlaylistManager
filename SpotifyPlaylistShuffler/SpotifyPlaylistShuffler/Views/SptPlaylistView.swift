//
//  SptPlaylistView.swift
//  SpotifyPlaylistShuffler
//
//  Created by Jan Stusio on 24/07/2024.
//

import SwiftUI

/// View for displaying user playlists
struct SptPlaylistView: View {
    @StateObject var viewModel = SptPlaylistViewModel()
    
    var body: some View {
        List(viewModel.playlists) { playlist in
            NavigationLink(destination: SptSongsView(playlist: playlist)) {
                Text(playlist.name)
            }
        }
        .navigationTitle("Playlists")
        .onAppear {
            viewModel.fetchPlaylists()
            print("dupa")
        }
    }
}


#Preview {
    SptPlaylistView()
}
