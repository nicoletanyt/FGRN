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
    
    var body: some View {
        NavigationView {
            VStack {
                Text(question.question)
                    .foregroundColor(Color.darkTeal)
                    .font(.system(.largeTitle))
                    .padding(.bottom, 200)
                TextField("Enter Your Input", text: $question.input)
                    .font(.system(size: 25))
                    .foregroundColor(Color.lightBlue)
                Divider()
                 .frame(height: 4)
                 .background(Color.lightBlue)
            }
            .padding(.horizontal, 50)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "questionmark")
                        .padding()
                        .background(Color.darkTeal)
                        .foregroundColor(Color.white)
                        .cornerRadius(15)
                }
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button {
                            //Toggle previous question
                            if currentQuestionNum > 0 {
                                currentQuestionNum -= 1
                                question = arrayOfQuestions[currentQuestionNum]
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
                                currentQuestionNum += 1
                                question = arrayOfQuestions[currentQuestionNum]
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

struct EnterInputPage_Previews: PreviewProvider {
    static var previews: some View {
        EnterInputPage(question: arrayOfQuestions[0], currentQuestionNum: 0)
    }
}