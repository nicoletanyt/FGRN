//
//  EnterInputPage.swift
//  FGRN
//
//  Created by NICOLE TAN YITONG stu on 29/10/22.
//

import SwiftUI

struct EnterInputPage: View {
    @State var question: Question
    @State var currentQuestionNum: Int
    @State var currentProgress: CGFloat = 0.0
    
    @State var language = WelcomePage().languageToggle
    var body: some View {
        NavigationView {
            VStack {
                Text(question.question)
                    .foregroundColor(Color.darkTeal)
                    .font(.system(.largeTitle))
                    .padding(.bottom, 200)
                if question.options != [] {
                    Picker (selection: $question.input) {
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
                    TextField("Enter Your Input", text: $question.input)
                        .font(.system(size: 25))
                        .foregroundColor(Color.lightBlue)
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
                        Image(systemName: "questionmark")
                            .padding()
                            .background(Color.darkTeal)
                            .foregroundColor(Color.white)
                            .cornerRadius(50)
                    }
                    ToolbarItem(placement: .bottomBar) {
                        HStack {
                            Button {
                                //Toggle previous question
                                if currentQuestionNum > 0 {
                                    arrayOfQuestions[currentQuestionNum] = question //saves the question
                                    currentQuestionNum -= 1
                                    question = arrayOfQuestions[currentQuestionNum]
                                    currentProgress -= 1/15
                                }
                            } label: {
                                if currentQuestionNum != 0 {
                                    toggleButton(next: false)
                                }
                            }
                            Spacer()
                            Button {
                                //Toggle next question
                                if currentQuestionNum < arrayOfQuestions.count - 1{
                                    arrayOfQuestions[currentQuestionNum] = question //saves the question
                                    currentQuestionNum += 1
                                    question = arrayOfQuestions[currentQuestionNum]
                                    currentProgress += 1/15 //15 is the number of questions in the array
                                }
                                if currentQuestionNum - 1 == 0 {
                                    //question about time
                                    if arrayOfQuestions[currentQuestionNum - 1].input != "" {
                                        //changes only if the input is changed, otherwise it'll give the default "day"
                                        greetingFills[0] = arrayOfQuestions[currentQuestionNum - 1].input
                                    }
                                }
                                if currentQuestionNum - 1 == 1 {
                                    //currentQuestionNum == 1: second question about name
                                    arrayOfQuestions[4].options[0] = "Dear " + arrayOfQuestions[currentQuestionNum - 1].input
                                    arrayOfQuestions[4].options[3] = "Greetings " + arrayOfQuestions[currentQuestionNum - 1].input
                                    arrayOfQuestions[4].options[5] = "Hi " + arrayOfQuestions[currentQuestionNum - 1].input
                                    
                                    greetingFills[1] = arrayOfQuestions[currentQuestionNum - 1].input //sets the name
                                    arrayOfQuestions[4].options[4] = "Good " + greetingFills[0] + greetingFills[1]
                                }
                                if currentQuestionNum - 1 == 2 {
                                    //currentQuestionNum == 2: third question about job of person
                                    //this code will run when the current question is the next question so currentQuestionNum - 1 gives the answer of the previous question answered
                                    arrayOfQuestions[4].options[1] = "Dear " + arrayOfQuestions[currentQuestionNum - 1].input
                                }
                            } label: {
                                toggleButton(next: true)
                            }
                        }
                    }
                }
        }
    }
}

struct toggleButton: View {
    var next: Bool //True for next button, false for back button
    
    var body: some View {
        HStack {
            Text(next ? "Next" : "Back")
            Image(systemName: next ? "arrowtriangle.right.fill": "arrowtriangle.left.fill")
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
