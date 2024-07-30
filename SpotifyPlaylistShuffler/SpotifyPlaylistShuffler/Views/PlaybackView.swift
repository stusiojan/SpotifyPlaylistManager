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
            Text(song.track.name)
                .font(.largeTitle)
                .padding()
            
            AsyncImage(url: URL(string: song.track.album.images.first?.url ?? ""))
//                .scaledToFit()
//                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 400)
                .clipped()
            
            Text(song.track.artists.first?.name ?? "Unknown artist")
                .font(.title2)
            HStack {
                Text(song.track.album.name)
                    .font(.title3)
                Text("(\(song.track.album.releaseDate))")
                    .font(.title3)
            }
            
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
            Logger.shared.log("Picture dim: ")
            viewModel.currentSong = song
        }
    }
}


#Preview {
    PlaybackView(song: Song(addedAt: "12", addedBy: AddedBy(externalUrls: ExternalUrls(spotify: "aaa"), href: "aaa", id: "aaa", type: "aaa", uri: "aaa"), isLocal: false, primaryColor: nil, track: Track(previewUrl: nil, availableMarkets: ["PL"], explicit: true, type: "rap", episode: false, track: true, album: Album(availableMarkets: ["PL"], type: "rap", albumType: "rap", href: "aaa", id: "aaa", images: [SptImage(height: 600, url: "", width: 600)], name: "aaa", releaseDate: "aaa", releaseDatePrecision: "aaa", uri: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.maklowicz.pl%2F&psig=AOvVaw1t8tJRolFNA1_IKjtnkSQF&ust=1722373104330000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCPDD4_qRzYcDFQAAAAAdAAAAABAE", artists: [Artist(externalUrls: ExternalUrls(spotify: "aaa"), href: "aaa", id: "aaa", name: "aaa", type: "aaa", uri: "aaa")], externalUrls: ExternalUrls(spotify: "aaa"), totalTracks: 10), artists: [Artist(externalUrls: ExternalUrls(spotify: "aaa"), href: "aaa", id: "aaa", name: "aaa", type: "aaa", uri: "aaa")], discNumber: 1, trackNumber: 1, durationMs: 5000, externalIds: ExternalIds(isrc: "aaa"), externalUrls: ExternalUrls(spotify: "aaa"), href: "aaa", id: "aaa", name: "aaa", popularity: 5879, uri: "aaa", isLocal: false), videoThumbnail: VideoThumbnail(url: "")))
}
