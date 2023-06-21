//
//  ContentView.swift
//  News
//
//  Created by Marco Alonso Rodriguez on 19/06/23.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject private var viewModel = NewsViewModel()
    @State private var topicToSearch = ""
  
    
    var body: some View {
        NavigationStack {
            VStack {
                
                TopicSegmentedView(viewModel: viewModel)
                
                List(viewModel.news, id: \.title) { article in
                    ArticleNewCell(article: article)
                }.listStyle(.plain)
                
                if viewModel.isLoading {
                    LoadingView()
                }
                
            }
            .searchable(text: $topicToSearch, prompt: "Write your topic to search news")
            .onChange(of: topicToSearch, perform: { newTopic in
                if newTopic != "" {
                    viewModel.getNews(topic: newTopic)
                }
            })
            .onAppear { viewModel.getNews(topic: viewModel.topics.first!)}
            
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
            .navigationBarTitle("Top Global News")
            .navigationBarItems(trailing: NavigationLink(destination: {
                EmptyView()
            }, label: {
                Image(systemName: "ellipsis.circle")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}

