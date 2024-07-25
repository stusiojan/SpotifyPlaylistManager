//
//  PlaybackView.swift
//  SpotifyPlaylistShuffler
//
//  Created by Jan Stusio on 24/07/2024.
//

import SwiftUI

/// View for playback controls
struct PlaybackView: View {
    let song: Song
    @StateObject var viewModel = PlaybackViewModel()
    
    var body: some View {
        VStack {
            Text(song.name)
                .font(.largeTitle)
                .padding()
            
            AsyncImage(url: URL(string: song.albumCoverUrl))
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: 300)
            
            Text(song.artist)
                .font(.title2)
            Text(song.album)
                .font(.title3)
            
            HStack {
                Button(action: viewModel.previous) {
                    Image(systemName: "backward.fill")
                }
                Button(action: {
                    viewModel.play()
                }) {
                    Image(systemName: viewModel.isPlaying ? "pause.fill" : "play.fill")
                }
                Button(action: viewModel.next) {
                    Image(systemName: "forward.fill")
                }
            }
            .font(.largeTitle)
            .padding()
        }
        .onAppear {
            viewModel.currentSong = song
        }
    }
}


//#Preview {
//    PlaybackView()
//}
