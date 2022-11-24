//
//  EnterInputPage.swift
//  FGRN
//
//  Created by NICOLE TAN YITONG stu on 29/10/22.
//

import SwiftUI

struct EnterInputPage: View {
    //    @EnvironmentObject var inputManager: InputDataStore
    @State var questionsArray: [Question]
    @State var currentQuestionNum: Int = 0
    @State var currentProgress: CGFloat = 0.0
    @State var language: Bool //true for chinese, false for english
    //    @State var isActive2: Bool = false
    
    @State var isHintGiven = false
    @State var isInfoGiven = false
    @Binding var welcomePageActive: Bool
    
    var body: some View {
        NavigationView {
            VStack(alignment:.leading){
                Text(questionsArray[currentQuestionNum].question)
                    .foregroundColor(Color.textColor)
                    .font(.system(.largeTitle))
                    .padding(.bottom, 200)
                if questionsArray[currentQuestionNum].options != [] {
                    Picker(selection: $questionsArray[currentQuestionNum].input) {
                        ForEach(questionsArray[currentQuestionNum].options, id: \.self) { option in
                            Text(option)
                                .tag(option)
                                .font(.system(size: 25))
                        }
                    } label: {
                        Text("Picker")
                    }
                    .accentColor(Color.textColor)
                    .pickerStyle(.menu)
                    
                } else {
                    if #available(iOS 16.0, *) {
                        TextField(language ? "输入" : "Enter Your Input", text: $questionsArray[currentQuestionNum].input, axis: .vertical)
                            .font(.system(size: 25))
                            .foregroundColor(Color.lightBlue)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .submitLabel(.next)
                            .onSubmit {
                                updateQuestion()
                            }
                    } else {
                        // Fallback on earlier versions
                    }
                }
                Divider()
                    .frame(height: 4)
                    .background(Color.lightBlue)
                if isHintGiven == true {
                    switch currentQuestionNum {
                    case 0:
                        Text(language ? "这是一个问候， 利用时间" : "This is a polite greeting depending on the time of day.")
                            .bold()
                            .foregroundColor(Color.textColor)
                            .padding()
                        
                    case 1:
                        Text(language ? "输入他/她的姓名或姓" : "You can enter their name, surname or title (Ms., Mr.)")
                            .bold()
                            .foregroundColor(Color.textColor)
                            .padding()
                    case 2:
                        Text(language ? "输入他/她的职业，部门，公司" : "You can enter their job, department or group / company.")
                            .bold()
                            .foregroundColor(Color.textColor)
                            .padding()
                    case 3:
                        Text(language ? "电邮的主题" : "Topic of your email")
                            .bold()
                            .foregroundColor(Color.textColor)
                            .padding()
                    case 4:
                        Text(language ? "根据您的电子邮件的形式选择" : "Choose based on the formality of your email")
                            .bold()
                            .foregroundColor(Color.textColor)
                            .padding()
                    case 5:
                        Text(language ? "我正在写这封电子邮件给 ___（告诉，问，等）你" : "I am writing this email to ___(inform, tell, etc.) you")
                            .bold()
                            .foregroundColor(Color.textColor)
                            .padding()
                    case 6:
                        Text(language ? "你的电邮的目的是什么？" : "Why are you writing your email?")
                            .bold()
                            .foregroundColor(Color.textColor)
                            .padding()
                    case 7:
                        Text(language ? "目的的观点是什么？" : "What is the point of your purpose?")
                            .bold()
                            .foregroundColor(Color.textColor)
                            .padding()
                    case 8:
                        Text(language ? "你要问的一个问题" : "What is a question you want to ask the recipient?")
                            .bold()
                            .foregroundColor(Color.textColor)
                            .padding()
                    case 9:
                        Text(language ? "电邮的背景是什么？" : "What is the background of this email?")
                            .bold()
                            .foregroundColor(Color.textColor)
                            .padding()
                    case 10:
                        Text(language ? "要告诉收件人的事情" : "Something to tell the recipient")
                            .bold()
                            .foregroundColor(Color.textColor)
                            .padding()
                    case 11:
                        Text(language ? "要告诉收件人的事情" : "Something to tell the recipient")
                            .bold()
                            .foregroundColor(Color.textColor)
                            .padding()
                    case 12:
                        Text(language ? "您的收件人的背景是什么，您应该记住哪些传统？" : "What is your recipient’s background, any traditions you should keep in mind?")
                            .bold()
                            .foregroundColor(Color.textColor)
                            .padding()
                    case 13:
                        Text(language ? "有什么你应该避免谈论的问题吗？" : "Are there any issues that you should avoid talking about?")
                            .bold()
                            .foregroundColor(Color.textColor)
                            .padding()
                    case 14:
                        Text(language ? "你要怎么结束你的电邮？公务，或者是私人？" : "How do you want to end the email? tip: sincerely is used when you know your recipient’s name, faithfully is when you don’t know your recipient’s name")
                            .bold()
                            .foregroundColor(Color.textColor)
                    case 15:
                        Text(language ? "你的名字是什么？" : "To sign off your email")
                            .bold()
                            .foregroundColor(Color.textColor)
                            .padding()
                    default:
                        EmptyView()
                    }
                    
                }
            }
            .padding(.horizontal, 50)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    ZStack (alignment: .leading) {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color.conDarkTeal)
                            .frame(width: 300, height: 30)
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color.white)
                            .frame(width: 300 * currentProgress, height: 15)
                            .padding(.horizontal, 10)
                    }
                    .padding()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isHintGiven = true
                        // do something
                    } label: {
                        Image(systemName: "questionmark")
                            .padding(10)
                            .background(Color.conDarkTeal)
                            .foregroundColor(Color.white)
                            .cornerRadius(50)
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button {
                            isHintGiven = false
                            //Toggle previous question
                            if currentQuestionNum > 0 {
                                currentQuestionNum -= 1
                                currentProgress -= 1/16
                            }
                        } label: {
                            if currentQuestionNum != 0 {
                                toggleButton(type: language ? "返回" : "Back")
                            }
                        }
                        Spacer()
                        if currentQuestionNum == arrayOfQuestions.count - 1 {
                            Button {
                                //                                print(questionsArray.filter {$0.questionType == "Closing"})
                                isInfoGiven = true
                            } label: {
                                toggleButton(type: language ? "制造" : "Generate")
                            }
                        } else {
                            Button { //Toggle next question
                                isHintGiven = false
                                if currentQuestionNum < questionsArray.count{
                                    updateQuestion()
                                }
                            } label: {
                                toggleButton(type: language ? "下一题" : "Next")
                            }
                            
                        }
                        
                    }
                }
            }
        }
        .sheet(isPresented: $isInfoGiven) {
            DisplayInfoPage(language: language, basicInfo: questionsArray.filter {$0.questionType == "Basic Info" && $0.input != ""}, greetingInfo: questionsArray.filter {$0.questionType == "Greeting" && $0.input != ""}, contentInfo: questionsArray.filter {$0.questionType == "Content" && $0.input != ""}, closingInfo: questionsArray.filter {$0.questionType == "Closing" && $0.input != ""}, welcomePageActive: $welcomePageActive)
        }
    }
    
    func updateQuestion() {
        switch(currentQuestionNum) {
        case 0:
            basicInfo["Time"] = questionsArray[currentQuestionNum].input
            break
        case 1:
            basicInfo["Name"] = questionsArray[currentQuestionNum].input
            if basicInfo["Name"] != "" {
                questionsArray[4].options[1] = language ? "亲爱的" : "Dear " + (basicInfo["Name"] ?? "")
                questionsArray[4].options[4] = language ? "问候" : "Greetings " + (basicInfo["Name"] ?? "")
                questionsArray[4].options[6] = language ? "你好" : "Hi " + (basicInfo["Name"] ?? "")
                if basicInfo["Time"] != "" {
                    questionsArray[4].options[5] = language ? (basicInfo["Name"] ?? "") + "好" +  (basicInfo["Name"] ?? "") : "Good " + (basicInfo["Time"] ?? "") + " " + (basicInfo["Name"] ?? "")
                }
            }
            break
        case 2:
            basicInfo["Job"] = questionsArray[currentQuestionNum].input
            if basicInfo["Job"] != "" {
                questionsArray[4].options[2] = language ? "亲爱的" : "Dear " + (basicInfo["Job"] ?? "")
            }
            break
        default:
            break
        }
        currentQuestionNum += 1
        currentProgress += 1/16
    }
}
struct toggleButton: View {
    var type: String
    
    var body: some View {
        HStack {
            Text(type)
            Image(systemName: type == "Back" || type == "返回" ? "arrowtriangle.left.fill": "arrowtriangle.right.fill")
        }
        .padding()
        .background(Color.conDarkTeal)
        .foregroundColor(Color.white)
        .cornerRadius(15)
    }
}

//
//struct EnterInputPage_Previews: PreviewProvider {
//    static var previews: some View {
//        EnterInputPage
//    }
//}
