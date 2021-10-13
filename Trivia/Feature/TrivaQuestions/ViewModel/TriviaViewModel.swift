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
    
    @Published private(set) var trivia: Trivia = Trivia.dummyTrivia
    
    private let service: TriviaService
    
    init(service: TriviaService) {
        self.service = service
    }
    
    func getTrivia() async {
        do {
            self.trivia = try await service.fetchTrivia()
        } catch {
            print(error)
        }
    }
    
}

