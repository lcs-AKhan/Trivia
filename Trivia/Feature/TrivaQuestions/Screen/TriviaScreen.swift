//
//  TriviaScreen.swift
//  Trivia
//
//  Created by Abdul Ahad Khan on 2021-10-10.
//

import SwiftUI

struct TriviaScreen: View {
    
    @State private var answers: [String] = []
    
    @State private var scoreTitle: String = ""
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    
    var body: some View {
        VStack {
            Text(Trivia.dummyTrivia.first!.category)
                .font(.title2)
            Text("Difficulty: \(Trivia.dummyTrivia.first!.difficulty)")
                .font(.title3)
                .padding(.vertical)
            Text(Trivia.dummyTrivia.first!.question)
                .padding([.leading, .bottom, .trailing])
            
            ForEach(0 ..< 3) { answer in
                Button(action: {
                    checkForAnswer(answer)
                }) {
                    Text(self.answers[answer])
                }
            }
            
        }
    }
    func shuffleAnswers() {
        let correct: String = Trivia.dummyTrivia.first!.correct_answer
        let incorrect: [String] = Trivia.dummyTrivia.first!.incorrect_answers
        answers.append(contentsOf: incorrect)
        answers.append(correct)
        answers.shuffle()
    }
    func checkForAnswer(_ answer: Int) {
        if answer == correctAnswer {
            scoreTitle = "Correct!"
        } else {
            scoreTitle = "Incorrect!"
        }
    }
}

struct TriviaScreen_Previews: PreviewProvider {
    static var previews: some View {
        TriviaScreen()
    }
}