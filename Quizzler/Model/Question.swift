//
//  Question.swift
//  Quizzler
//
//  Created by Марина on 02.08.2023.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answers = a
        self.correctAnswer = correctAnswer
    }
}
