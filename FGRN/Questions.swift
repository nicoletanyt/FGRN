//
//  Questions.swift
//  FGRN
//
//  Created by NICOLE TAN YITONG stu on 29/10/22.
//

import Foundation

struct Question {
    var question: String
    var input: String
    var options: [String]? = []
    var questionNumber: Int
}

var arrayOfQuestions: [Question] = [
    Question(question: "What is your subject?", input: "", questionNumber: 1),
    Question(question: "Enter the recipient's name.", input: "", questionNumber: 2),
    Question(question: "Enter the recipent's job.", input: "", questionNumber: 3),
//    Question(question: "Choose your salutation.", input: "", options: ["dear \(arrayOfQuestions[0].input), dear [job], to whom it may concern, greetings [name], good [morning / afternoon / evening / day] [name], hi [name]"], questionNumber: 4)
]
