//
//  WebView.swift
//  SpotifyPlaylistShuffler
//
//  Created by Jan Stusio on 24/07/2024.
//

import SwiftUI
import WebKit

/// WKWebView bridge to SwiftUI
struct WebView: UIViewRepresentable {
    var url: URL
    @Binding var showWebView: Bool
    var vm: ConnectWithSptViewModel
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        init(parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
            if let responseURL = navigationResponse.response.url {
                getAccessToken(url: responseURL)
                parent.showWebView = false
            }
            decisionHandler(.allow)
        }
        
        func getAccessToken(url: URL) {
            var tokenString: String = ""
            let urlString: String = url.absoluteString
            if urlString.contains("#access_token=") {
                let range = urlString.range(of: "#access_token=")
                guard let index = range?.upperBound else { return }
                
                tokenString = String(urlString[index...])
            }
            if !tokenString.isEmpty {
                let range = tokenString.range(of: "&token_type=Bearer")
                guard let index = range?.lowerBound else { return }
                
                tokenString = String(tokenString[..<index])
                UserDefaults.standard.setValue(tokenString, forKey: "Authorization")
                parent.vm.authorize()
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}


//#Preview {
//    WebView(url: URL(string: "https://www.google.com")!, showWebView: .constant(true))
//}
