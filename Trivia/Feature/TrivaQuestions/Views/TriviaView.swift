//
//  ContentView.swift
//  Trivia
//
//  Created by Abdul Ahad Khan on 2021-10-07.
//

import SwiftUI

struct ContentView: View {
    
    @State private var answers: [String] = []
    
    var body: some View {
        VStack {
            Text(Trivia.dummyTrivia.first!.category)
                .font(.title2)
            Text("Difficulty: \(Trivia.dummyTrivia.first!.difficulty)")
                .font(.title3)
                .padding(.vertical)
            Text(Trivia.dummyTrivia.first!.question)
                .padding([.leading, .bottom, .trailing])
            
        }
    }
    func shuffleAnswers() {
        let correct: String = Trivia.dummyTrivia.first!.correct_answer
        let incorrect: [String] = Trivia.dummyTrivia.first!.incorrect_answers
        answers.append(contentsOf: incorrect)
        answers.append(correct)
        answers.shuffle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
