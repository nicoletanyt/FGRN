//
//  WelcomePage.swift
//  FGRN
//
//  Created by NICOLE TAN YITONG stu on 29/10/22.
//

import SwiftUI

struct WelcomePage: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.darkTeal
                VStack {
                    //Insert Icon Here
                    NavigationLink {
                        EnterInputPage(question: arrayOfQuestions[0], currentQuestionNum: 0)
                    } label: {
                        ButtonDisplay(text: "Email Generating")
                    }
                    NavigationLink {
                        
                    } label: {
                        ButtonDisplay(text: "Credits")
                    }
                }
                .navigationTitle("Homepage")
                .navigationBarTitleDisplayMode(.inline)
            }
            .ignoresSafeArea(.all)
        }
    }
}

struct ButtonDisplay: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.system(size: 30))
            .foregroundColor(Color.white)
            .frame(width: 300, height: 100)
            .background(Color.lightBlue)
            .cornerRadius(10)
            .padding(20)
    }
}

struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePage()
    }
}
