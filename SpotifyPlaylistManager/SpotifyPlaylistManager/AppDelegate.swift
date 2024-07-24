//
//  AppDelegate.swift
//  SpotifyPlaylistManager
//
//  Created by Jan Stusio on 18/07/2024.
//

import UIKit
import SwiftUI

class AppDelegate: UIResponder, UIApplicationDelegate, SPTSessionManagerDelegate {
    let authManager = SpotifyAuthManager.shared
    
    func sessionManager(manager: SPTSessionManager, didInitiate session: SPTSession) {
        Logger.shared.log("Success initializing sessionManager")
    }
    
    func sessionManager(manager: SPTSessionManager, didFailWith error: any Error) {
        Logger.shared.log("Fail initializing sessionManager, error: \(String(describing: error))", level: .error)
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Your code here")
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        // Use this method if your SpotifyRedirectURL is a native deeplink
        Logger.shared.log("Redirected from auth.")
    
        
        Logger.shared.log("Return: \(authManager.sessionManager.application(app, open: url, options: options))")
        return authManager.sessionManager.application(app, open: url, options: options)
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([any UIUserActivityRestoring]?) -> Void) -> Bool {
        Logger.shared.log("Redirected from auth.")
        // Use this method if your SpotifyRedirectURL is an universal link (https/http)
        return authManager.sessionManager.application(application, continue: userActivity, restorationHandler: restorationHandler)
    }
    
//    func applicationWillResignActive(_ application: UIApplication) {
//        if (rootViewController.appRemote.isConnected) {
//            rootViewController.appRemote.disconnect()
//        }
//    }
//
//    func applicationDidBecomeActive(_ application: UIApplication) {
//        if let _ = rootViewController.appRemote.connectionParameters.accessToken {
//            rootViewController.appRemote.connect()
//        }
//    }
}

