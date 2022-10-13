//
//  TriviaService.swift
//  Trivia
//
//  Created by Abdul Ahad Khan on 2021-10-10.
//

import Foundation

protocol TriviaService {
    func fetchTrivia() async throws -> TriviaResponse
}

final class TriviaServiceImpl: TriviaService {
    func postStringProcess(text: String) -> String {
        guard let data = Data(base64Encoded: text) else {
            return ""
        }

        return String(data: data, encoding: .utf8) ?? " "
    }
    
    final func fetchTrivia() async throws -> TriviaResponse {
        
        let urlSession = URLSession.shared
        let url = URL(string:
                        "https://opentdb.com/api.php?amount=1&encode=base64")
        // Fetch the raw data
        let (data, _) = try await urlSession.data(from: url!)
        let decoder = JSONDecoder()
        let result = try decoder.decode(TriviaResponse.self, from:data)
        
        var processedList:[Trivia] = []
        for trivia in result.results {
            var incorrect_answers:[String] = []
            for answer in trivia.incorrect_answers{
                incorrect_answers.append(postStringProcess(text: answer))
            }
            processedList.append(Trivia(category: postStringProcess(text: trivia.category), type: postStringProcess(text: trivia.type), difficulty: postStringProcess(text: trivia.difficulty), question: postStringProcess(text: trivia.question), correct_answer: postStringProcess(text: trivia.correct_answer), incorrect_answers: incorrect_answers))
        }
        
        return TriviaResponse(response_code: result.response_code, results: processedList)

    }
    
}
