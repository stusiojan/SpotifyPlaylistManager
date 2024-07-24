//
//  ConnectWithSptViewModelTests.swift
//  SpotifyPlaylistShufflerTests
//
//  Created by Jan Stusio on 24/07/2024.
//

import XCTest
@testable import SpotifyPlaylistShuffler

/// Unit tests for ConnectWithSptViewModel
class ConnectWithSptViewModelTests: XCTestCase {

    var viewModel: ConnectWithSptViewModel!

    override func setUp() {
        super.setUp()
        viewModel = ConnectWithSptViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testConnectToSpotify() {
        viewModel.connectToSpotify()
        // Add assertion to verify the connection logic
        // This might be a mock test in real scenario
        XCTAssertTrue(viewModel.isConnected)
    }
}
