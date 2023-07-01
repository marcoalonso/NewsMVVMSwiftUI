//
//  FeedbackView.swift
//  News
//
//  Created by Marco Alonso Rodriguez on 20/06/23.
//

import SwiftUI

struct FeedbackView: View {
    
    @State var isShowingActivityView = false
    
    var body: some View {
        VStack {
            List(actions) { action in
                HStack {
                    Image(systemName: action.icon)
                        .resizable()
                        .frame(width: 25, height: 25)
                    
                    Text(action.name)
                        .font(.body)
                }.padding(12)
            }.listStyle(.plain)
                .frame(height: 400)
            
            Spacer()
            
                .navigationTitle("Mas Acciones")
                .navigationBarItems(trailing: Button(action: {
                    isShowingActivityView = true
                }, label: {
                    Image(systemName: "square.and.arrow.up.fill")
                }))
        }
        .sheet(isPresented: $isShowingActivityView, content: {
                    ActivityView(activityItems: ["https://apps.apple.com/us/app/top-global-news/id6447653915se-world/id6447369429"])
                })
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView()
    }
}
