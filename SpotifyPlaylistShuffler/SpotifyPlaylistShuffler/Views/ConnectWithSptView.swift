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
                SptPlaylistView()
            } else {
                Button("Connect") {
                    viewModel.connectToSpotify()
                }
            }
        }
        .sheet(isPresented: $viewModel.showWebView) {
            if let authURL = viewModel.authURL {
                NavigationStack {
                    WebView(url: authURL, showWebView: $viewModel.showWebView, vm: viewModel)
                        .ignoresSafeArea()
                        .navigationTitle("Login to spotify")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}


#Preview {
    ConnectWithSptView()
}
