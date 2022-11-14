//
//  Questions.swift
//  FGRN
//
//  Created by NICOLE TAN YITONG stu on 29/10/22.
//

import Foundation

struct Question: Identifiable, Codable, Hashable {
    var id = UUID()
    
    var question: String
    var input: String
    var options: [String] = []
    var questionType: String
}

var greetingFills = ["Morning ", "Name "] //Good [morning / afternoon / evening / day] [name]

var arrayOfQuestions: [Question] = [
    //Questions needed for email info
    Question(question: "When do you want to send your email?", input: "", options: ["Morning", "Afternoon", "Evening", "Day"], questionType:"Basic Info"),
    Question(question: "Enter the recipient's name.", input: "", questionType:"Basic Info"),
    Question(question: "Enter the recipent's job.", input: "", questionType:"Basic Info"),
    Question(question: "What is your subject?", input: "", questionType:"Basic Info"),
    
    Question(question: "Greeting", input: "", options: ["dear [name]", "dear [job]", "To whom it may concern", "greetings [name]", "Good [morning / afternoon / evening / day] [name]", "hi [name]"], questionType:"Greeting"),
    Question(question: "Action word", input: "", options: ["inform", "ask", "inquire", "advocate", "propose"], questionType:"Greeting"),
    
    Question(question: "What is the purpose of your email?", input: "", questionType:"Content"),
    Question(question: "Point", input: "", questionType:"Content"),
    Question(question: "Question", input: "", questionType:"Content"),
    Question(question: "Context?", input: "", questionType:"Content"),
    Question(question: "Info 1", input: "", questionType:"Content"),
    Question(question: "Info 2", input: "", questionType:"Content"),
    Question(question: "Culture", input: "", questionType:"Content"),
    Question(question: "Sensitive issues of the audience", input: "", questionType:"Content"),
    
    Question(question: "Closing", input: "", options: ["regards", "best regards", "yours sincerely", "yours faithfully", "thanks", "thank you", "thanks in advance", "cheers"], questionType:"Closing"),
    Question(question: "What is your name / title?", input: "", questionType:"Closing"),
]
