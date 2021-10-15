//
//  ContentView.swift
//  Trivia
//
//  Created by Abdul Ahad Khan on 2021-10-07.
//

import SwiftUI

struct TriviaView: View {
    
    let trivia: Trivia
    
    @State private var isCorrect = false
    
    @State private var scoreMessage = ""
    
    @State private var gameEnded = false
            
    @State private var answers: [String] = []
    
    var body: some View {
        
        ZStack {
            Color.orange
                .ignoresSafeArea()
            VStack {
                
                Text(trivia.category)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .font(.title2)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .border(Color.blue, width: 5)
                
                VStack {
                    Text("Difficulty: \(trivia.difficulty)")
                            .font(.title3)
                            .padding(.vertical)
                            .foregroundColor(.black)
                        
                    Text(trivia.question)
                            .padding([.leading, .bottom, .trailing])
                            .foregroundColor(.black)
                } .background(Color.white)
                    .cornerRadius(40)
                    .edgesIgnoringSafeArea([.trailing, .leading])
                    .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.white, lineWidth: 5)
                        )
                
                
                ForEach(answers, id: \.self) { answer in
                    Button(action: {
                        if answer == trivia.correct_answer {
                            isCorrect = true
                            scoreMessage = "Correct!"
                            gameEnded = true
                        } else {
                            isCorrect = false
                            scoreMessage = "Incorrect!"
                            gameEnded = true
                        }
                    }) {
                        Text(answer)
                            .fontWeight(.bold)
                                .font(.title3)
                                .padding()
                                .background(Color.purple)
                                .cornerRadius(40)
                                .foregroundColor(.white)
                                .overlay(
                                        RoundedRectangle(cornerRadius: 40)
                                            .stroke(Color.purple, lineWidth: 5)
                                    )
                    }
                    .padding(.vertical)
                }
                if gameEnded {
                    switch isCorrect {
                    case true:
                        Text(scoreMessage)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 140, height: 50)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color.green, lineWidth: 5)
                                )
                        
                    default:
                        Text(scoreMessage)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 140, height: 50)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color.red, lineWidth: 5)
                                )
                    }
//                    Button(action: {
//                        // Get new trivia
//                    }) {
//                        Text("Next Question")
//                            .font(.title2)
//                            .fontWeight(.heavy)
//                            .foregroundColor(.blue)
//                    }
                }
            }
            .task {
                shuffleAnswers()
            }
        }
        .frame(maxHeight: .infinity)
    }
    func shuffleAnswers() {
        answers = []
        let correct: String = trivia.correct_answer
        let incorrect: [String] = trivia.incorrect_answers
        answers.append(contentsOf: incorrect)
        answers.append(correct)
        answers.shuffle()
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView(trivia: TriviaResponse.dummyTrivia.last!.results.last!)
    }
}
