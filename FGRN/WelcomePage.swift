//
//  WelcomePage.swift
//  FGRN
//
//  Created by NICOLE TAN YITONG stu on 29/10/22.
//

import SwiftUI

struct WelcomePage: View {
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.init(.white)]
    }
    
    @State var languageToggle = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.darkTeal
                VStack {
                    //Insert Icon Here
                    Image("APP-LOGO")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Toggle(languageToggle ? "Change Chinese to English" : "Change English to Chinese", isOn: $languageToggle)
//                        .padding()
                        .foregroundColor(.white)
                        .frame(width: 300, height: 100)
                    NavigationLink {
                        EnterInputPage(question: arrayOfQuestions[0], currentQuestionNum: 0)
                    } label: {
                        ButtonDisplay(text: languageToggle ? "写电邮" : "Email Generating")
                        }
                    
                    NavigationLink {
                        TutorialPage()
                    } label: {
                        ButtonDisplay(text: "Tutorial")
                    }
                    NavigationLink {
                        CreditsPage()
                    } label: {
                        Text("Credits")
                            .font(.system(size: 30))
                            .foregroundColor(Color.darkTeal)
                            .frame(width: 300, height: 50)
                            .background(Color.lightTeal)
                            .cornerRadius(10)
                            .padding(20)
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
