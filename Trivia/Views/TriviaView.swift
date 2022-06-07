//
//  TriviaView.swift
//  Trivia
//
//  Created by Xiao Yuan on 6/7/22.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    var body: some View {
        if(triviaManager.reachedEnd) {
            VStack(spacing: 20) {
                Text("Trivia Game")
                    .lilacTitle()
                    .foregroundColor(Color("AccentColor"))
                
                Text("Congratulations, you completed the game. 🏀").foregroundColor(.white)
                
                Text("You scored \(triviaManager.score) out of \(triviaManager.length)")
                
                Button {
                    Task.init {
                        await triviaManager.fetchTrivial()
                    }
                } label: {
                    PrimaryButton(text: "Play again")
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Background"))
        } else {
            QuestionView()
                 .environmentObject(triviaManager)
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager())
    }
}
