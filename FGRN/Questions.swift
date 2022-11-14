//
//  Questions.swift
//  FGRN
//
//  Created by NICOLE TAN YITONG stu on 29/10/22.
//

import Foundation

struct Question: Identifiable, Codable {
    var id = UUID()
    
    var question: String
    var input: String
    var options: [String] = []
}

var greetingFills = ["Morning ", "Name "] //Good [morning / afternoon / evening / day] [name]

var arrayOfQuestions: [Question] = [
    //Questions needed for email info
    Question(question: "When do you want to send your email?", input: "", options: ["Morning", "Afternoon", "Evening", "Day"]),
    Question(question: "Enter the recipient's name.", input: ""),
    Question(question: "Enter the recipent's job.", input: ""),
    Question(question: "What is your subject?", input: ""),
    
    Question(question: "Greeting", input: "", options: ["dear [name]", "dear [job]", "To whom it may concern", "greetings [name]", "Good [morning / afternoon / evening / day] [name]", "hi [name]"]),
    Question(question: "Action word", input: "", options: ["inform", "ask", "inquire", "advocate", "propose"]),
    
    Question(question: "What is the purpose of your email?", input: ""),
    Question(question: "Point", input: ""),
    Question(question: "Question", input: ""),
    Question(question: "Context?", input: ""),
    Question(question: "Info 1", input: ""),
    Question(question: "Info 2", input: ""),
    Question(question: "Culture", input: ""),
    Question(question: "Sensitive issues of the audience", input: ""),
    
    Question(question: "Closing", input: "", options: ["regards", "best regards", "yours sincerely", "yours faithfully", "thanks", "thank you", "thanks in advance", "cheers"]),
    Question(question: "What is your name / title?", input: ""),
]
