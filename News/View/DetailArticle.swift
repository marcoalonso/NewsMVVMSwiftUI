//
//  DetailArticle.swift
//  News
//
//  Created by Marco Alonso Rodriguez on 20/06/23.
//

import SwiftUI

struct DetailArticle: View {
    @State var openURL = false
    
    let article: Noticia
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15.0) {
                    ArticleNewRemoteImage(urlString: article.urlToImage ?? "")
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(12)
                
                Text(article.title ?? "")
                    .font(.title2)
                    .foregroundColor(.black)
                    .bold()
                        
                
                Text(article.description ?? "")
                    .font(.body)
                    .foregroundColor(.black)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                
                HStack {
                    Text(article.source.name ?? "")
                    Text(Date().shortFormat())
                }
                Button(action: {
                    openURL = true
                }, label: {
                    Text("Visitar sitio web")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color.red)
                        .cornerRadius(12)
                        .shadow(radius: 12)
                    
                })
                .foregroundColor(.red)
                .font(.body)
            }
            .frame(maxWidth: 300)
//            .sheet(isPresented: $openURL, content: {
//                ///Go to Web Page
//                if let url = article.url, url != "" {
//                    safari(urlString: url)
//                }
//            })
        }
    }
}

struct DetailArticle_Previews: PreviewProvider {
    static var previews: some View {
        DetailArticle(article: MockData.article)
    }
}
