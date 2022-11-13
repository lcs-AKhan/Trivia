
import SwiftUI
import ConfettiSwiftUI

struct TriviaView: View {
    
    let trivia: Trivia
    
    @State private var counter = 0
    
    @State private var isCorrect = false
    
    @State private var scoreMessage = ""
    
    @State private var gameEnded = false
    
    @State private var currentAnswer = ""
    
    @State private var scoreInt = 0
            
    @State private var answers: [String] = []
    
    let callback: () async -> ()
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    VStack {
                        
                        Text(trivia.category)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .font(.title2)
                            .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 150)
                            .border(Color.blue, width: 5)
                            .padding(.horizontal)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
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
                        .fixedSize(horizontal: false, vertical: true)
                    
                    ForEach(answers, id: \.self) { answer in
//                        if gameEnded == false {
                            Button(action: {
                                if answer == trivia.correct_answer {
                                    isCorrect = true
                                    scoreMessage = "Correct!"
                                    counter += 1
                                } else {
                                    isCorrect = false
                                    scoreMessage = "Incorrect!"
                                }
                                currentAnswer = answer
                                gameEnded = true
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
                                        .fixedSize(horizontal: false, vertical: true)
                            }
                            .confettiCannon(counter: $counter, num: 50)
                            .padding(.vertical)
                            .disabled(gameEnded)
//                        } else {
//                            if answer == trivia.correct_answer {
//                                Text(answer)
//                                    .fontWeight(.bold)
//                                        .font(.title3)
//                                        .padding()
//                                        .background(Color.purple)
//                                        .cornerRadius(40)
//                                        .foregroundColor(.white)
//                                        .overlay(
//                                                RoundedRectangle(cornerRadius: 40)
//                                                    .stroke(Color.green, lineWidth: 5)
//                                            )
//                                        .padding(.vertical)
//                                        .fixedSize(horizontal: false, vertical: true)
//                                        .frame(alignment: .center)
//                            } else {
//                                Text(answer)
//                                    .fontWeight(.bold)
//                                        .font(.title3)
//                                        .padding()
//                                        .background(Color.purple)
//                                        .cornerRadius(40)
//                                        .foregroundColor(.white)
//                                        .overlay(
//                                                RoundedRectangle(cornerRadius: 40)
//                                                    .stroke(Color.purple, lineWidth: 5)
//                                            )
//                                        .padding(.vertical)
//                                        .fixedSize(horizontal: false, vertical: true)
//                                        .frame(alignment: .center)
//                            }
//                        }
                    }
                    if gameEnded == false {
                        Text("")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 100, height: 40)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color.green, lineWidth: 5)
                                )
                            .padding(.top)
                            .opacity(0)
                        
                        Text("Next Question")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.blue)
                            .padding(.vertical)
                            .opacity(0)
                        
                    }
                    if gameEnded {
                        switch isCorrect {
                        case true:
                            Text(scoreMessage)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 100, height: 40)
                                .overlay(
                                        RoundedRectangle(cornerRadius: 40)
                                            .stroke(Color.green, lineWidth: 5)
                                    )
                                .padding(.top)
                            
                        default:
                            Text(scoreMessage)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 100, height: 40)
                                .overlay(
                                        RoundedRectangle(cornerRadius: 40)
                                            .stroke(Color.red, lineWidth: 5)
                                    )
                                .padding(.top)
                        }
                        
                        Button(action: {
                            Task {
                                await callback()
                            }
                        }) {
                            Text("Next Question")
                                .font(.title2)
                                .fontWeight(.heavy)
                                .foregroundColor(.blue)
                                .padding(.vertical)
                        }
                    }
                    Text("")
    //                Text("Score: \(scoreInt)")
    //                    .font(.title3)
    //                    .fontWeight(.heavy)
    //                    .foregroundColor(.white)
    //                    .padding(.all)
                }
                .task {
                    shuffleAnswers()
                    
                }
            }
                .frame(maxHeight: .infinity)
                .background(Image("OrangeBackground"))
        }
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
/*
struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView(trivia: TriviaResponse.dummyTrivia.last!.results.last!, callback:)
    }
}
*/
