//
//  NewsViewModel.swift
//  News
//
//  Created by Marco Alonso Rodriguez on 20/06/23.
//

import Foundation

final class NewsViewModel: ObservableObject {
    @Published var appetizers: [Noticia] = []
    @Published var isLoading: Bool = false
    
    func getNews() {
        isLoading = true
    }
}
