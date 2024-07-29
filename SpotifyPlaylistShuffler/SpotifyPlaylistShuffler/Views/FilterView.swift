//
//  FilterView.swift
//  SpotifyPlaylistShuffler
//
//  Created by Jan Stusio on 24/07/2024.
//

import SwiftUI

/// View for filtering songs
struct FilterView: View {
    @ObservedObject var viewModel: FilterViewModel
//    @Environment(SptSongsViewModel.self) private var vm
    @Binding var songs: [Song]
    
    var body: some View {
        VStack {
            TextField("Filter by artist", text: $viewModel.filterCriteria)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Sort by popularity") {
                songs = viewModel.filterSongs(songs)
            }
            
            Spacer()
        }
        .padding()
    }
}


//#Preview {
//    FilterView()
//}
