//
//  Answer.swift
//  Trivia
//
//  Created by Xiao Yuan on 6/7/22.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
