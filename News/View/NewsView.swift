//
//  ContentView.swift
//  News
//
//  Created by Marco Alonso Rodriguez on 19/06/23.
//

import SwiftUI
import SafariServices

struct NewsView: View {
    
    @StateObject private var viewModel = NewsViewModel()
    @State private var topicToSearch = ""
    @State var openURL = false
    @State private var urlArticle: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 5.0) {
                
                TopicSegmentedView(viewModel: viewModel)
                
                List(viewModel.news, id: \.title) { article in
                    
                    Button {
                        self.urlArticle = article.url ?? ""
                        openURL = true
                    } label: {
                        ArticleNewCell(article: article)
                    }

                }.listStyle(.inset)
                
                
            }
            .sheet(isPresented: $openURL, content: {
                safari(urlString: $urlArticle)
            })
            .searchable(text: $topicToSearch, prompt: "Write your topic to search news")
            .onChange(of: topicToSearch, perform: { newTopic in
                if newTopic != "" {
                    withAnimation {
                        viewModel.getNews(topic: newTopic)
                    }
                }
            })
            .onAppear {
                withAnimation(.easeIn(duration: 0.5)) {
                    viewModel.getNews(topic: viewModel.topics.first!)
                }
            }
            
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
            .navigationBarTitle("Top Global News", displayMode: .inline)
            .navigationBarItems(leading: NavigationLink(destination: FeedbackView(), label: {
                Text("Mas")
            }))
            .navigationBarItems(trailing: NavigationLink(destination: {
                FeedbackView()
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

struct safari : UIViewControllerRepresentable {
    
    @Binding var urlString: String
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<safari>) -> SFSafariViewController {
        let controller = SFSafariViewController(url: URL(string: urlString)!)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<safari>) {
        
    }
}
