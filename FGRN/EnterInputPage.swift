//
//  EnterInputPage.swift
//  FGRN
//
//  Created by NICOLE TAN YITONG stu on 29/10/22.
//

import SwiftUI

struct EnterInputPage: View {
    //    @EnvironmentObject var inputManager: InputDataStore
    @State var question: Question
    @State var questionsArray: [Question]
    @State var currentQuestionNum: Int
    @State var currentProgress: CGFloat = 0.0
    @State var language: Bool //true for chinese, false for english
    //    @State var isActive2: Bool = false
    
    @State var isHintGiven = false
    @State var isInfoGiven = false
    @Binding var welcomePageActive: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text(question.question)
                    .foregroundColor(Color.textColor)
                    .font(.system(.largeTitle))
                    .padding(.bottom, 200)
                if question.options != [] {
                    Picker(selection: $question.input) {
                        ForEach(question.options, id: \.self) { option in
                            Text(option)
                                .tag(option)
                                .foregroundColor(Color.lightBlue)
                                .font(.system(size: 25))
                        }
                    } label: {
                        Text("Picker")
                    }
                    .pickerStyle(.menu)
                    
                } else {
                    if #available(iOS 16.0, *) {
                        TextField(language ? "输入" : "Enter Your Input", text: $question.input, axis: .vertical)
                            .font(.system(size: 25))
                            .foregroundColor(Color.lightBlue)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .submitLabel(.next)
                            .onSubmit {
                                if currentQuestionNum < questionsArray.count - 1 {
                                    questionsArray[currentQuestionNum] = question //saves the question
                                    currentQuestionNum += 1
                                    question = questionsArray[currentQuestionNum]
                                    currentProgress += 1/16 //15 is the number of questions in the array
                                }
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
                            .foregroundColor(Color.darkTeal)
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
                            .background(Color.darkTeal)
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
                                questionsArray[currentQuestionNum] = question //saves the question
                                currentQuestionNum -= 1
                                question = questionsArray[currentQuestionNum]
                                currentProgress -= 1/16
                            }
                        } label: {
                            if currentQuestionNum != 0 {
                                toggleButton(type: language ? "返回" : "Back")
                            }
                        }
                        Spacer()
                        if currentQuestionNum == arrayOfQuestions.count - 1 {
                            //                                NavigationLink {
                            Button {
                                //                                    DisplayInfoPage(questionsArray: questionsArray, language: language)
                                isInfoGiven = true
                            } label: {
                                toggleButton(type: language ? "制造" : "Generate")
                            }
                            //                                .onAppear {
                            //                                    inputManager.addInput(questionsArray) //saves the input
                            //                                }
                        } else {
                            Button {
                                isHintGiven = false
                                //Toggle next question
                                if currentQuestionNum < questionsArray.count - 1{
                                    questionsArray[currentQuestionNum] = question //saves the question
                                    currentQuestionNum += 1
                                    question = questionsArray[currentQuestionNum]
                                    currentProgress += 1/16 //15 is the number of questions in the array
                                }
                                
                                if currentQuestionNum == 1 {
                                    //question about time
                                    if questionsArray[currentQuestionNum - 1].input != "" {
                                        //changes only if the input is changed, otherwise it'll give the default "day"
                                        if language {
                                            chineseGreetingFills[0] = questionsArray[currentQuestionNum - 1].input
                                        } else {
                                            greetingFills[0] = questionsArray[currentQuestionNum - 1].input
                                        }
                                    }
                                }
                                if currentQuestionNum == 2 {
                                    //currentQuestionNum == 1: second question about name
                                    if language {
                                        questionsArray[4].options[1] = "亲爱的" + questionsArray[currentQuestionNum - 1].input
                                        questionsArray[4].options[4] = "问候" + questionsArray[currentQuestionNum - 1].input
                                        questionsArray[4].options[6] = "你好" + questionsArray[currentQuestionNum - 1].input
                                        questionsArray[4].options[5] = chineseGreetingFills[0] + "好" +  chineseGreetingFills[1]
                                        chineseGreetingFills[1] = questionsArray[currentQuestionNum - 1].input //sets the name
                                        //                                        questionsArray[15].options[0] = chineseGreetingFills[1] + "祝"
                                        //                                        questionsArray[15].options[1] = chineseGreetingFills[1]
                                    } else {
                                        questionsArray[4].options[1] = "Dear " + questionsArray[currentQuestionNum - 1].input
                                        questionsArray[4].options[4] = "Greetings " + questionsArray[currentQuestionNum - 1].input
                                        questionsArray[4].options[6] = "Hi " + questionsArray[currentQuestionNum - 1].input
                                        questionsArray[4].options[5] = "Good " + greetingFills[0] + " " + greetingFills[1]
                                        greetingFills[1] = questionsArray[currentQuestionNum - 1].input //sets the name
                                    }
                                }
                                if currentQuestionNum - 1 == 2 {
                                    //currentQuestionNum == 2: third question about job of person
                                    //this code will run when the current question is the next question so currentQuestionNum - 1 gives the answer of the previous question answered
                                    if language {
                                        questionsArray[4].options[2] = "亲爱的" + questionsArray[currentQuestionNum - 1].input
                                    } else {
                                        questionsArray[4].options[2] = "Dear " + questionsArray[currentQuestionNum - 1].input
                                    }
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
}

struct toggleButton: View {
    var type: String
    
    var body: some View {
        HStack {
            Text(type)
            Image(systemName: type == "Back" || type == "返回" ? "arrowtriangle.left.fill": "arrowtriangle.right.fill")
        }
        .padding()
        .background(Color.darkTeal)
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
