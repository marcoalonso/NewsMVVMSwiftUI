//
//  TopicSegmented.swift
//  News
//
//  Created by Marco Alonso Rodriguez on 20/06/23.
//

import SwiftUI

struct TopicSegmentedView: View {
    
    let viewModel: NewsViewModel
    @State var topicSelected = ""
   
    
    var body: some View {
        Picker("List of topics", selection: $topicSelected, content: {
            ForEach(viewModel.topics, id: \.self) { topic in
                Text(topic)
            }
        }).pickerStyle(.segmented)
            .padding(15)
            .onChange(of: topicSelected) { newTopic in
                viewModel.getNews(topic: newTopic)
            }
    }
}
