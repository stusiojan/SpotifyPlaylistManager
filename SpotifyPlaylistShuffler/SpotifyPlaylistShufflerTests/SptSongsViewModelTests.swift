//
//  SptSongsViewModelTests.swift
//  SpotifyPlaylistShufflerTests
//
//  Created by Jan Stusio on 24/07/2024.
//

import XCTest
@testable import SpotifyPlaylistShuffler

/// Unit tests for SptSongsViewModel
class SptSongsViewModelTests: XCTestCase {

    var viewModel: SptSongsViewModel!

    override func setUp() {
        super.setUp()
        viewModel = SptSongsViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testFetchSongs() {
        let expectation = XCTestExpectation(description: "Fetch songs")
        
        viewModel.fetchSongs(for: "testPlaylistId")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertFalse(self.viewModel.songs.isEmpty)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
