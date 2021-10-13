//
//  Trivia.swift
//  Trivia
//
//  Created by Abdul Ahad Khan on 2021-10-07.
//

import Foundation

struct Trivia: Decodable {
    
    let category: String
    let type: String
    let difficulty: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
    
}

extension Trivia {
    static let dummyTrivia: Trivia =
        Trivia(category: "Entertainment: Board Games",
               type: "Multiple",
               difficulty: "Medium",
               question: "What special item did the creators of Cards Against Humanity ship for their Black Friday pack?",
               correct_answer: "Bull Feces",
               incorrect_answers: ["A Card Expansion","A Racist Toy","Cat Urine"])
}


//{
//   "response_code":0,
//   "results":[
//      {
//         "category":"Entertainment: Board Games",
//         "type":"multiple",
//         "difficulty":"medium",
//         "question":"What special item did the creators of Cards Against Humanity ship for their Black            Friday pack?",
//         "correct_answer":"Bull Feces",
//         "incorrect_answers":[
//            "A Card Expansion",
//            "A Racist Toy",
//            "Cat Urine"
//         ]
//      }
//   ]
//}
