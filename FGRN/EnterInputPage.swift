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
                    TextField(language ? "输入" : "Enter Your Input", text: $question.input)
                        .font(.system(size: 25))
                        .foregroundColor(Color.lightBlue)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .submitLabel(.next)
                        .onSubmit {           if currentQuestionNum < questionsArray.count - 1{
                            questionsArray[currentQuestionNum] = question //saves the question
                            currentQuestionNum += 1
                            question = questionsArray[currentQuestionNum]
                            currentProgress += 1/16 //15 is the number of questions in the array
                        } }
                }
                Divider()
                    .frame(height: 4)
                    .background(Color.lightBlue)
            }         .padding(.horizontal, 50)
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
                                    
                                    //Toggle next question
                                    if currentQuestionNum < questionsArray.count - 1{
                                        questionsArray[currentQuestionNum] = question //saves the question
                                        currentQuestionNum += 1
                                        question = questionsArray[currentQuestionNum]
                                        currentProgress += 1/16 //15 is the number of questions in the array
                                    }
                                    if currentQuestionNum - 1 == 0 {
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
                                    if currentQuestionNum - 1 == 1 {
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
                .sheet(isPresented: $isHintGiven) {
                    HintsPage(language: language, currentquestion: currentQuestionNum)
                }
                .sheet(isPresented: $isInfoGiven) {
                    DisplayInfoPage(questionsArray: questionsArray, isSheetGive: false, language: language, welcomePageActive: $welcomePageActive)
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
