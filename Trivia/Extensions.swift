//
//  Extensions.swift
//  Trivia
//
//  Created by Xiao Yuan on 6/7/22.
//

import Foundation
import SwiftUI

extension Text {
    func lilacTitle() -> some View {
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
}
