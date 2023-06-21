//
//  NewsViewModel.swift
//  News
//
//  Created by Marco Alonso Rodriguez on 20/06/23.
//

import Foundation

final class NewsViewModel: ObservableObject {
    @Published var news: [Noticia] = []
    @Published var isLoading: Bool = false
    @Published var alertItem: AlertItem?
    let topics = ["economia", "ai", "apple", "twitter", "calor"]
    
    func getNews(topic: String) {
        isLoading = true
        
        NetworkManager.shared.getLisOfNews(topic: topic) { [weak self] result in
            DispatchQueue.main.async {
                guard let self else { return }
                self.isLoading = false
                switch result {
                case .success(let news):
                    self.news = news
                    
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .decodingError:
                        self.alertItem = AlertContext.decodingError
                        
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
