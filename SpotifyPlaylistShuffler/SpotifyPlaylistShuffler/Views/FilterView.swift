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
    
    var body: some View {
        VStack {
            TextField("Filter by artist", text: $viewModel.filterCriteria)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Apply Filter") {
                // Implement filter application logic
            }
            
            Spacer()
        }
        .padding()
    }
}


//#Preview {
//    FilterView()
//}
