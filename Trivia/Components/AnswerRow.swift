//
//  AnswerView.swift
//  Trivia
//
//  Created by Xiao Yuan on 6/7/22.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var triviaManager: TriviaManager
    var answer: Answer
    @State private var isSelected = false
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
            
            Text(answer.text)
                .bold()
            
            if isSelected {
                Spacer()
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? Color("Green") : Color("Red"))
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(.black)
        .background(triviaManager.answerSelected ? (isSelected ?  Color("AccentColor") : .white) : Color("AccentColor"))
        .cornerRadius(10)
        .shadow(color: isSelected ? (answer.isCorrect ? Color("Green") : Color("Red")) : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !triviaManager.answerSelected {
                isSelected = true
                triviaManager.selectAnswer(answer: answer)
            }
        }
    }
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "Single", isCorrect: true))
            .environmentObject(TriviaManager())
    }
}
