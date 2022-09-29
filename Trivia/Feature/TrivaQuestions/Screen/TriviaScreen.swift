//
//  TriviaScreen.swift
//  Trivia
//
//  Created by Abdul Ahad Khan on 2021-10-10.
//

import SwiftUI

struct TriviaScreen: View {
    
    @StateObject private var vm = TriviaViewModelImpl(
        service: TriviaServiceImpl()
    )
        
    var body: some View {
                
        VStack {
            if vm.trivia.isEmpty {
                
                LoadingView(text: "Fetching Trivia")
                
            } else {
                
                
                TriviaView(trivia: vm.trivia.last!.results.last!, callback: vm.getTrivia)
                
                
            }

        } .task {
            await vm.getTrivia()
        }
    }
}

struct TriviaScreen_Previews: PreviewProvider {
    static var previews: some View {
        TriviaScreen()
    }
}
