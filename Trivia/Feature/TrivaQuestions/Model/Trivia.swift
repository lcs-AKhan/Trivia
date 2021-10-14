//
//  Trivia.swift
//  Trivia
//
//  Created by Abdul Ahad Khan on 2021-10-07.
//

import Foundation

struct TriviaResponse: Decodable {
    
    let response_code: Int
    let results: [Trivia]
}

struct Trivia: Decodable {

    let category: String
    let type: String
    let difficulty: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
    
    init(category: String, type: String, difficulty: String, question: String, correct_answer: String, incorrect_answers: [String]) {
        self.category = category
        self.type = type
        self.difficulty = difficulty
        self.question = question
        self.correct_answer = correct_answer
        self.incorrect_answers = incorrect_answers
    }
    
    init(from decoder: Decoder) throws {
        
        // This tells the compiler what JSON keys to decode
        // All keys listed will be decoded
        enum CodingKeys: CodingKey {
            case category, type, difficulty, question, correct_answer, incorrect_answers
        }
        
        // Creates a container to temporarily hold the values decoded from JSon
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.category = try container.decode(String.self, forKey: .category)
        
        self.type = try container.decode(String.self, forKey: .type)
        
        self.difficulty = try container.decode(String.self, forKey: .difficulty)
        
        self.question = try container.decode(String.self, forKey: .question)
        
        self.correct_answer = try container.decode(String.self, forKey: .correct_answer)
        
        self.incorrect_answers = try container.decode(Array.self, forKey: .incorrect_answers)
        
    }
    
}



extension TriviaResponse {
    static let dummyTrivia: [TriviaResponse] = [
        TriviaResponse(
            response_code: 0,
            results:
                [Trivia(
                    category: "Entertainment: Board Games",
                    type: "Multiple",
                    difficulty: "Medium",
                    question: "What special item did the creators of Cards Against Humanity ship for their Black Friday pack?",
                    correct_answer: "Bull Feces",
                    incorrect_answers: ["A Card Expansion","A Racist Toy","Cat Urine"
                ]
                )
                ]
            
        )
    ]
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


//let url = URL(string: "https://opentdb.com/api.php?amount=1")!
//
//let task = URLSession.shared.dataTask(with: url) { data, response, error in
//
//  // ensure there is no error for this HTTP response
//  guard error == nil else {
//    print ("error: \(error!)")
//    return
//  }
//
//  // ensure there is data returned from this HTTP response
//  guard let data = data else {
//    print("No data")
//    return
//  }
//
//  // Parse JSON into Dictionary that contains Array of Car struct using JSONDecoder
//  guard let triviaArrDict = try? JSONDecoder().decode([String: [Trivia]].self, from: data) else {
//    print("Error: Couldn't decode data into dictionary of array of cars")
//    return
//  }
//
//  let trivia = triviaArrDict["results"]!
//
//}
