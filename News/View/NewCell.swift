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
        VStack(spacing: 15.0) {
            HStack {
                
                ArticleNewRemoteImage(urlString: article.urlToImage ?? "")
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 70)
                    .cornerRadius(12)
                    
                
                Text(article.title ?? "")
                    .lineLimit(3)
                    .font(.system(size: 15))
                    .foregroundColor(.blue)
            }
            
            Text(article.description ?? "")
                .font(.body)
                .foregroundColor(.black)
                .lineLimit(4)
                .padding(.leading, 10)
                .padding(.trailing, 10)
            
            HStack {
                Text(article.source.name ?? "")
                    .font(.footnote)
                    .foregroundColor(.red)
                
                Text(article.publishedAt ?? "")
                    .font(.footnote)
                    .foregroundColor(.red)
            }
        }
        .background(.ultraThinMaterial)
            .cornerRadius(12)
        
    }
}
