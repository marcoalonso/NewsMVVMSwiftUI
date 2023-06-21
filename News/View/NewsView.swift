//
//  ContentView.swift
//  News
//
//  Created by Marco Alonso Rodriguez on 19/06/23.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject private var viewModel = NewsViewModel()
    @State private var topicSelected = ""
    private let topics = ["economia", "ai", "apple", "twitter", "calor"]
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("List of topics", selection: $topicSelected, content: {
                    ForEach(topics, id: \.self) { topic in
                        Text(topic)
                    }
                }).pickerStyle(.segmented)
                .padding(15)
                .onChange(of: topicSelected) { newTopic in
                    viewModel.getNews(topic: newTopic)
                }

                
                List(viewModel.news, id: \.title) { article in
                    ArticleNewCell(article: article)
                }.listStyle(.plain)
            }.onAppear {
                viewModel.getNews(topic: topics[0])
            }
            .navigationBarTitle("Top Global News")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}


