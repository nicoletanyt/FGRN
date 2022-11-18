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
    Question(question: "When do you want to send your email?", input: "", options: ["Choose Info", "Morning", "Afternoon", "Evening", "Day"], questionType:"Basic Info"),
    Question(question: "Enter the recipient's name.", input: "", questionType:"Basic Info"),
    Question(question: "Enter the recipent's job.", input: "", questionType:"Basic Info"),
    Question(question: "What is your subject?", input: "", questionType:"Basic Info"),
    
    Question(question: "Greeting", input: "", options: ["Choose Info", "Dear [name]", "Dear [job]", "To whom it may concern", "Greetings [name]", "Good [Morning / Afternoon / Evening / Day] [name]", "Hi [name]"], questionType:"Greeting"),
    Question(question: "Action word", input: "", options: ["Choose Info", "Inform", "Ask", "Inquire", "Advocate", "Propose"], questionType:"Greeting"),
    
    Question(question: "What is the purpose of your email?", input: "", questionType:"Content"),
    Question(question: "Point", input: "", questionType:"Content"),
    Question(question: "Question", input: "", questionType:"Content"),
    Question(question: "Context?", input: "", questionType:"Content"),
    Question(question: "Info 1", input: "", questionType:"Content"),
    Question(question: "Info 2", input: "", questionType:"Content"),
    Question(question: "Culture", input: "", questionType:"Content"),
    Question(question: "Sensitive issues of the audience", input: "", questionType:"Content"),
    
    Question(question: "Closing", input: "", options: ["Choose Info", "Regards", "Best Regards", "Yours Sincerely", "Yours Faithfully", "Thanks", "Thank You", "Thanks in Advance", "Cheers"], questionType:"Closing"),
    Question(question: "What is your name / title?", input: "", questionType:"Closing"),
]
