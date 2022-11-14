//
//  HintsPage.swift
//  FGRN
//
//  Created by FAITH CHONG RUI EN stu on 5/11/22.
//

import SwiftUI

struct HintsPage: View {
    @State var language: Bool
    @State var currentquestion: Int
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        switch currentquestion {
        case 0:
            Text(language ? "这是一个问候， 利用时间" : "This is a polite greeting depending on the time of day.")
                .bold()
                .foregroundColor(Color.textColor)
        case 1:
            Text(language ? "输入他/她的姓名或姓" : "You can enter their name, surname or title (Ms., Mr.)")
                .bold()
                .foregroundColor(Color.textColor)
        case 2:
            Text(language ? "输入他/她的职业，部门，公司" : "You can enter their job, department or group / company.")
                .bold()
                .foregroundColor(Color.textColor)
        case 3:
            Text(language ? "电邮的主题" : "Topic of your email")
                .bold()
                .foregroundColor(Color.textColor)
        case 4:
            Text(language ? "根据您的电子邮件的形式选择" : "Choose based on the formality of your email")
                .bold()
                .foregroundColor(Color.textColor)
        case 5:
            Text(language ? "我正在写这封电子邮件给 ___（告诉，问，等）你" : "I am writing this email to ___(inform, tell, etc.) you")
                .bold()
                .foregroundColor(Color.textColor)
        case 6:
            Text(language ? "你的电邮的目的是什么？" : "Why are you writing your email?")
                .bold()
                .foregroundColor(Color.textColor)
        case 7:
            Text(language ? "目的的观点是什么？" : "What is the point of your purpose?")
                .bold()
                .foregroundColor(Color.textColor)
        case 8:
            Text(language ? "你要问的一个问题" : "What is a question you want to ask the recipient?")
                .bold()
                .foregroundColor(Color.textColor)
        case 9:
            Text(language ? "电邮的背景是什么？" : "What is the background of this email?")
                .bold()
                .foregroundColor(Color.textColor)
        case 10:
            Text(language ? "要告诉收件人的事情" : "Something to tell the recipient")
                .bold()
                .foregroundColor(Color.textColor)
        case 11:
            Text(language ? "要告诉收件人的事情" : "Something to tell the recipient")
                .bold()
                .foregroundColor(Color.textColor)
        case 12:
            Text(language ? "您的收件人的背景是什么，您应该记住哪些传统？" : "What is your recipient’s background, any traditions you should keep in mind?")
                .bold()
                .foregroundColor(Color.textColor)
        case 13:
            Text(language ? "有什么你应该避免谈论的问题吗？" : "Are there any issues that you should avoid talking about?")
                .bold()
                .foregroundColor(Color.textColor)
        case 14:
            Text(language ? "你要怎么结束你的电邮？公务，或者是私人？" : "How do you want to end the email? tip: sincerely is used when you know your recipient’s name, faithfully is when you don’t know your recipient’s name")
                .bold()
                .foregroundColor(Color.textColor)
        case 15:
            Text(language ? "你的名字是什么？" : "To sign off your email")
                .bold()
                .foregroundColor(Color.textColor)
        default:
            EmptyView()
        }
    }
}
