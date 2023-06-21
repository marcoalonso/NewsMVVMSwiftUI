//
//  ContentView.swift
//  News
//
//  Created by Marco Alonso Rodriguez on 19/06/23.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject private var viewModel = NewsViewModel()
    @State private var topic = "ai"
    private let topics = ["economica", "AI", "apple"]
    
    var body: some View {
        VStack {
            List(viewModel.news, id: \.title) { article in
                
                ArticleNewCell(article: article)
                
            }
        }.onAppear {
            viewModel.getNews(topic: topic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}


