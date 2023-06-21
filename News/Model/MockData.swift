//
//  MockData.swift
//  News
//
//  Created by Marco Alonso Rodriguez on 20/06/23.
//

import Foundation

struct MockData {
    static let article = Noticia(source: Source(name: "Hipertextual"), title: "Si tienes uno de estos modelo de iPhone o iPad, malas noticias: no podrás instalar iOS 17", description: "iOS 17 ya es oficial. Y aunque todavía quedan algunos meses por delante hasta que estén disponibles para todos, ya puedes instalar la beta para desarrolladores. Como viene siendo habitual, junto con todas las novedades, Apple también ha anunciado los dispositivos compatibles con los nuevos sistemas operativos. Aunque iOS 17 incluye pocas novedades de peso respecto a iOS 16, lo cierto es que hay algunos modelos de iPhone y iPad que se quedan por el camino. Lo mismo sucede con watchOS 10 y macOS Sonoma.", url: "https://hipertextual.com/2023/06/dispositivos-compatibles-con-ios-17", urlToImage: "https://imgs.hipertextual.com/wp-content/uploads/2023/06/namedrop-ios-17.jpeg", publishedAt: "2023-06-06T14:02:32Z")
}
                                 
                                 
extension Date {
    func shortFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: self)
    }
}
