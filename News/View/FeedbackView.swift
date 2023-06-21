//
//  FeedbackView.swift
//  News
//
//  Created by Marco Alonso Rodriguez on 20/06/23.
//

import SwiftUI

struct FeedbackView: View {
    var body: some View {
        VStack {
            Text("Feedback Screen")
                
            Text("Soon!")
            
        }
        .font(.largeTitle)
        .foregroundColor(.white)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.green]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
            )
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView()
    }
}
