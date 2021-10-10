//
//  TriviaService.swift
//  Trivia
//
//  Created by Abdul Ahad Khan on 2021-10-10.
//

import Foundation

protocol TriviaService {
    func fetchTrivia() async throws -> [Trivia]
}

final class TriviaServiceImpl: TriviaService {
    
    final func fetchTrivia() async throws -> [Trivia] {
        
        // Start a URL session to interact with the API
        let urlSession = URLSession.shared
        // Assemble the URL that points to the JSON endpoint
        let url = URL(string: APIConstants.baseURL.appending("/api.php?amount=1"))
        // Fetch the raw data
        let (data, _) = try await urlSession.data(from: url!)
        // Attempt to decode and return the array of characters
        return try JSONDecoder().decode([Trivia].self, from: data)
        
    }
    
}
