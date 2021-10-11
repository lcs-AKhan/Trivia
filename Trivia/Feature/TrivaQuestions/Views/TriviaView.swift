//
//  ContentView.swift
//  Trivia
//
//  Created by Abdul Ahad Khan on 2021-10-07.
//

import SwiftUI

struct TriviaView: View {
    
    let trivia: Trivia
    
    @State private var answers: [String] = []
    
    var body: some View {
        VStack {
            
            Text(trivia.category)
                .font(.title2)
            Text("Difficulty: \(trivia.difficulty)")
                .font(.title3)
                .padding(.vertical)
            Text(trivia.question)
                .padding([.leading, .bottom, .trailing])
            
            
            
        }
    }
    func shuffleAnswers() {
        let correct: String = trivia.correct_answer
        let incorrect: [String] = trivia.incorrect_answers
        answers.append(contentsOf: incorrect)
        answers.append(correct)
        answers.shuffle()
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView(trivia: Trivia.dummyTrivia.first!)
    }
}
