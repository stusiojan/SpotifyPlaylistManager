//
//  SpotifyPlaylistShufflerUITests.swift
//  SpotifyPlaylistShufflerUITests
//
//  Created by Jan Stusio on 24/07/2024.
//

import XCTest

final class SpotifyPlaylistShufflerUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testConnectButton() throws {
        let app = XCUIApplication()
        app.launch()
        
        let connectButton = app.buttons["Connect"]
        XCTAssertTrue(connectButton.exists)
        connectButton.tap()
        
        // Add assertions to verify successful connection
    }
    
    func testPlaylistsLoad() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Simulate login if needed
        
        let playlistCell = app.tables.cells.firstMatch
        XCTAssertTrue(playlistCell.waitForExistence(timeout: 10))
        playlistCell.tap()
        
        // Add assertions to verify playlists load correctly
    }
    
    func testSongSelection() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Simulate login if needed
        
        let playlistCell = app.tables.cells.firstMatch
        XCTAssertTrue(playlistCell.waitForExistence(timeout: 10))
        playlistCell.tap()
        
        let songCell = app.tables.cells.firstMatch
        XCTAssertTrue(songCell.waitForExistence(timeout: 10))
        songCell.tap()
        
        // Add assertions to verify song details view
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
