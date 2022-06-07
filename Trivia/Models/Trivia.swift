//
//  Trivia.swift
//  Trivia
//
//  Created by Xiao Yuan on 6/7/22.
//

import Foundation

struct Trivia: Decodable {
    var results: [Result]
    
    struct Result: Decodable, Identifiable {
        var id: UUID  {
            UUID()
        }
        var category: String
        var type: String
        var difficulty: String
        var question: String
        var correctAnswer: String
        var incorrectAnswers: [String]
        
        var formattedQuestion: AttributedString {
            do {
                return try AttributedString(markdown: question)
            } catch {
                print("Error setting formattedQuestion: \(error)")
                return ""
            }
        }
        
        var answers: [Answer] {
            do {
                
                let correct = [Answer(text: try AttributedString(markdown: correctAnswer), isCorrect: true)]
                let incorrects = try incorrectAnswers.map { ans in
                    Answer(text: try AttributedString(markdown: ans), isCorrect: false)
                }
                let allAns = correct + incorrects
                return allAns.shuffled()
                
            } catch {
                print("Error setting answers: \(error)")
                return []
            }
        }
        
    }
}
