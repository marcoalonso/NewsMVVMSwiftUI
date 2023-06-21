//
//  WebView.swift
//  News
//
//  Created by Marco Alonso Rodriguez on 20/06/23.
//

import Foundation
import WebKit
import SwiftUI


// MARK:  webview
struct WebView: UIViewRepresentable {
    var urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
        
    }
}
