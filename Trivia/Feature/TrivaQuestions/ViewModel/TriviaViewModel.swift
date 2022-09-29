//
//  TriviaViewModel.swift
//  Trivia
//
//  Created by Abdul Ahad Khan on 2021-10-10.
//

import Foundation

protocol TriviaViewModel: ObservableObject {
    func getTrivia() async
}

@MainActor
final class TriviaViewModelImpl: TriviaViewModel, ObservableObject {
    
    @Published private(set) var trivia: [TriviaResponse] = []
    
    private let service: TriviaService
    
    init(service: TriviaService) {
        self.service = service
    }
    
    func getTrivia() async {
        // Reset data
        trivia = []
        do {
            let newTrivia = try await service.fetchTrivia()
            trivia.append(newTrivia)
        } catch {
            print(error)
        }
    }
    
}

