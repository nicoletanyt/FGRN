//
//  Questions.swift
//  FGRN
//
//  Created by NICOLE TAN YITONG stu on 29/10/22.
//

import Foundation

struct Question: Identifiable {
    var id = UUID()
    
    var question: String
    var input: String
    var options: [String]? = []
    var questionNumber: Int
}

var arrayOfQuestions: [Question] = [
    Question(question: "What is your subject?", input: "ladies and gentlemen", questionNumber: 1),
    Question(question: "Enter the recipient's name.", input: "your attention please", questionNumber: 2),
    Question(question: "Enter the recipent's job.", input: "we have investigated the situation", questionNumber: 3),
    Question(question: "Enter the recipent's job.", input: "there has been a false alarm", questionNumber: 3),
    Question(question: "What is your subject?", input: "we apologise for", questionNumber: 1),
    Question(question: "Enter the recipient's name.", input: "any inconvenience caused", questionNumber: 2),
    Question(question: "Enter the recipent's job.", input: "thank you", questionNumber: 3),
    Question(question: "Enter the recipent's job.", input: "there has been a false alarm", questionNumber: 3),
    Question(question: "What is your subject?", input: "ladies and gentlemen", questionNumber: 1),
    Question(question: "Enter the recipient's name.", input: "your attention please", questionNumber: 2),
    Question(question: "Enter the recipent's job.", input: "we have investigated the situation", questionNumber: 3),
    Question(question: "Enter the recipent's job.", input: "there is a false alarm", questionNumber: 3),
//    Question(question: "Choose your salutation.", input: "", options: ["dear \(arrayOfQuestions[0].input), dear [job], to whom it may concern, greetings [name], good [morning / afternoon / evening / day] [name], hi [name]"], questionNumber: 4)
]
