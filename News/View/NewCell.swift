//
//  NewCell.swift
//  News
//
//  Created by Marco Alonso Rodriguez on 20/06/23.
//

import SwiftUI

struct ArticleNewCell: View {
    
    let article: Noticia
    
    var body: some View {
        VStack {
            HStack {
                ArticleNewRemoteImage(urlString: article.urlToImage ?? "")
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 80)
                    .cornerRadius(12)
                
                Text(article.title ?? "")
                    .font(.system(size: 18))
                    .foregroundColor(.purple)
            }
            
            Text(article.description ?? "")
                .font(.body)
                .foregroundColor(.black)
                .lineLimit(3)
            
            HStack {
                Text(article.source.name ?? "")
                    .font(.footnote)
                    .foregroundColor(.red)
                
                Text(article.publishedAt ?? "")
                    .font(.footnote)
                    .foregroundColor(.red)
            }
        }
    }
}
