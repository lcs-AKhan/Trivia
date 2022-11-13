//
//  LoadingView.swift
//  Trivia
//
//  Created by Abdul Ahad Khan on 2021-10-10.
//

import SwiftUI

import SwiftUI

struct LoadingView: View {
    
    let text: String
    
    var body: some View {
        Spacer()
        Spacer()
        
        VStack(spacing: 8) {
            ProgressView()
            Text("Fetching Trivia")
                .fontWeight(.bold)
                .font(.title3)
                .foregroundColor(.white)
                .padding(.top)
        } .background(Image("OrangeBackground"))
        
        Spacer()
        Spacer()
        Spacer()
    }
}

//struct LoadingView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoadingView(text: "Fetching Trivia...")
//    }
//}
