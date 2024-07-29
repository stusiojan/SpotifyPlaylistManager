//
//  SptSongsView.swift
//  SpotifyPlaylistShuffler
//
//  Created by Jan Stusio on 24/07/2024.
//

import SwiftUI
import Observation

/// View for displaying songs in a playlist
struct SptSongsView: View {
    let playlist: Playlist
    @Bindable var viewModel = SptSongsViewModel()
    @State private var showingFilter = false
    
    var body: some View {
        VStack {
            List(viewModel.songs) { song in
                NavigationLink(destination: PlaybackView(song: song)) {
                    Text(song.track.name)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Filter") {
                        showingFilter.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingFilter) {
                FilterView(viewModel: FilterViewModel(), songs: $viewModel.songs)
            }
        }
        .onAppear {
            Logger.shared.log("Playlist id: \(playlist.id)")
            viewModel.fetchSongs(for: playlist.id)
            Logger.shared.log("Songs requested.")
        }
    }
}


//#Preview {
//    SptSongsView()
//}
