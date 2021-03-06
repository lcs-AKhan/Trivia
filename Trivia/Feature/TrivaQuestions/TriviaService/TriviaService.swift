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
    
    final func fetchTrivia() async throws -> TriviaResponse {
        
        let urlSession = URLSession.shared
        let url = URL(string: APIConstants.baseURL.appending("/api.php?amount=1"))
        // Fetch the raw data
        let (data, _) = try await urlSession.data(from: url!)
        return try JSONDecoder().decode(TriviaResponse.self, from: data)
        
    }
    
}
