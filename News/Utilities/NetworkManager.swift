//
//  NetworkManager.swift
//  News
//
//  Created by Marco Alonso Rodriguez on 20/06/23.
//

import UIKit

enum APError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
    case decodingError
}

class NetworkManager: NSObject, ObservableObject {
    ///To use combine we need implement this var and adopt ObservableObject
    @Published var listNews: [Noticia]?
    @Published var errorMessage: String = ""
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    ///a1d105c3794c4e9db94dff5d4a19fda9
    ///f0797ef3b62d4b90a400ed224e0f82b7
    
    static let baseURL = "https://newsapi.org/v2/everything?apiKey=a1d105c3794c4e9db94dff5d4a19fda9&language=es&q="
    
    private override init() {}
    
    ///Using combine instead of closure
    func getLisOfNews(topic: String) {
        guard let url = URL(string: NetworkManager.baseURL + topic) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error { return }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(NoticiaData.self, from: data)
                ///Combine way, publising any changes when data is ready
                self.listNews = decodedResponse.articles
            } catch {
                print("Debug: decoding error \(error.localizedDescription)")
                self.errorMessage = error.localizedDescription
            }
        }
        task.resume()
    }
    
//    func getLisOfNews(topic: String, completed: @escaping (Result<[Noticia], APError>) -> Void ) {
//        guard let url = URL(string: NetworkManager.baseURL + topic) else {
//            completed(.failure(.invalidURL))
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let _ = error {
//                completed(.failure(.unableToComplete))
//                return
//            }
//
//
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completed(.failure(.invalidResponse))
//                return
//            }
//
//            guard let data = data else {
//                completed(.failure(.invalidData))
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let decodedResponse = try decoder.decode(NoticiaData.self, from: data)
//                completed(.success(decodedResponse.articles))
//                ///Combine way, publising any changes when data is ready
//                self.listNews = decodedResponse.articles
//            } catch {
//                print("Debug: decoding error \(error.localizedDescription)")
//                completed(.failure(.decodingError))
//            }
//        }
//        task.resume()
//    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}

