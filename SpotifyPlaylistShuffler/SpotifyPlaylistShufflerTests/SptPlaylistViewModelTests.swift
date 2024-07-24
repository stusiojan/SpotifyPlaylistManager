//
//  SptPlaylistViewModelTests.swift
//  SpotifyPlaylistShufflerTests
//
//  Created by Jan Stusio on 24/07/2024.
//

import XCTest
@testable import SpotifyPlaylistShuffler

/// Unit tests for SptPlaylistViewModel
class SptPlaylistViewModelTests: XCTestCase {

    var viewModel: SptPlaylistViewModel!

    override func setUp() {
        super.setUp()
        viewModel = SptPlaylistViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testFetchPlaylists() {
        let expectation = XCTestExpectation(description: "Fetch playlists")
        
        viewModel.fetchPlaylists()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertFalse(self.viewModel.playlists.isEmpty)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
