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
    var options: [String] = []
    var questionNumber: Int
}

var arrayOfQuestions: [Question] = [
    Question(question: "What is your subject?", input: "", questionNumber: 1),
    Question(question: "Enter the recipient's name.", input: "", questionNumber: 2),
    Question(question: "Enter the recipent's job.", input: "", questionNumber: 3),
    
    Question(question: "Greeting", input: "", options: ["dear [name]", "dear [job]", "to whom it may concern", "greetings [name]", "good [morning / afternoon / evening / day] [name]", "hi [name]"], questionNumber: 4),
    Question(question: "What is the purpose of your email?", input: "", questionNumber: 5),
    Question(question: "Point 1", input: "", questionNumber: 6),
    Question(question: "Action word", input: "", options: ["inform", "ask", "inquire", "advocate", "propose"], questionNumber: 7),
    Question(question: "Question 1", input: "", questionNumber: 8),
    Question(question: "Context?", input: "", questionNumber: 9),
    Question(question: "Info 1", input: "", questionNumber: 10),
    Question(question: "Info 2", input: "", questionNumber: 11),
    Question(question: "Culture", input: "", questionNumber: 12),
    Question(question: "Senstive issues of the audience", input: "", questionNumber: 13),
    Question(question: "Closing", input: "", options: ["regards", "best regards", "yours sincerely", "yours faithfully", "thanks", "thank you", "thanks in advance", "cheers"], questionNumber: 13)
]
