//
//  NewsViewModel.swift
//  News
//
//  Created by Marco Alonso Rodriguez on 20/06/23.
//

import Foundation
import Combine

final class NewsViewModel: ObservableObject {
    @Published var news: [Noticia] = []
    
    @Published var alertItem: AlertItem?
    ///Some changes to use combine
    private let service = NetworkManager.shared
    private var cancellables = Set<AnyCancellable>()
    
    let topics = ["Google", "Ai", "Apple", "Xcode", "Elon"]
    
    init () {
        setupSubscribers()
    }
    
    ///Using Combine
    func getNews(topic: String) {
        
        NetworkManager.shared.getLisOfNews(topic: topic)
        
    }
    
//    func getNews(topic: String) {
//        isLoading = true
//
//        NetworkManager.shared.getLisOfNews(topic: topic) { [weak self] result in
//            DispatchQueue.main.async {
//                guard let self else { return }
//                self.isLoading = false
//                switch result {
//                case .success(let news):
//                    self.news = news
//
//                case .failure(let error):
//                    switch error {
//                    case .invalidURL:
//                        self.alertItem = AlertContext.invalidURL
//
//                    case .decodingError:
//                        self.alertItem = AlertContext.decodingError
//
//                    case .invalidData:
//                        self.alertItem = AlertContext.invalidData
//
//                    case .invalidResponse:
//                        self.alertItem = AlertContext.invalidResponse
//
//                    case .unableToComplete:
//                        self.alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }
    
    ///This is a subscription to listen any changes on listNews var of the NetworkManager
    func setupSubscribers() {
        service.$listNews.sink { [weak self] articles in
            if let news = articles {
                DispatchQueue.main.async {
                    self?.news = news
                }
            }
        }
        .store(in: &cancellables)
    }
}
