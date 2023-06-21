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
    @State var articleSelected: Noticia?
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 5.0) {
                
                TopicSegmentedView(viewModel: viewModel)
                
                List(viewModel.news, id: \.title) { article in
                    
                    Button {
                        self.articleSelected = article
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            openURL = true
                        }
                        
                    } label: {
                        ArticleNewCell(article: article)
                    }

                }.listStyle(.inset)
                
                if viewModel.isLoading {
                    LoadingView()
                }
                
            }
            .sheet(isPresented: $openURL, content: {
                ///Go to Web Page
                if let url = articleSelected?.url {
                    safari(urlString: url)
                } else {
                    DetailArticle(article: articleSelected ?? MockData.article)
                }
                
                ///go to detail view
//                DetailArticle(article: articleSelected ?? MockData.article)
            })
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
            .navigationBarTitle("Top Global News", displayMode: .inline)
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
    
    var urlString: String
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<safari>) -> SFSafariViewController {
        let controller = SFSafariViewController(url: URL(string: urlString)!)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<safari>) {
        
    }
}
