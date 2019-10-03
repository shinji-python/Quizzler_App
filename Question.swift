//
//  Question.swift
//  Quizzler
//
//  Created by Shinji Homawoo on 9/26/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

//Create Question object and properties
class Question {
    let questionText : String
    let answer : Bool
    
    init(text : String, correctAnswer : Bool) {
        questionText = text
        answer = correctAnswer
    }
}
