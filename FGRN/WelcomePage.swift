//
//  WelcomePage.swift
//  FGRN
//
//  Created by NICOLE TAN YITONG stu on 29/10/22.
//

import SwiftUI

struct WelcomePage: View {
//    init() {
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.init(.white)]
//    }
    
    @State var languageToggle = false
    @State var isActive: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.darkTeal
                VStack {
                    //Insert Icon Here
                    Image("APP-LOGO")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .mask {
                            Circle()
                        }
                    Toggle(languageToggle ? "把中文改成英文" : "Change English to Chinese", isOn: $languageToggle)
                    //                        .padding()
                        .foregroundColor(Color.navColor)
                        .frame(width: 300, height: 100)
                    NavigationLink(destination: EnterInputPage(questionsArray: languageToggle ? arrayOfChineseQuestions : arrayOfQuestions, currentQuestionNum: 0, language: languageToggle, welcomePageActive: $isActive), isActive: $isActive) {
                        ButtonDisplay(text: languageToggle ? "写电邮" : "Generator", image: "envelope.circle.fill")
                        
                    }
                    
                    NavigationLink {
                        PastInputPage(language: languageToggle)
                    } label: {
                        ButtonDisplay(text: languageToggle ? "历史" : "History", image: "clock.circle.fill")
                    }
                    
                    NavigationLink {
                        TutorialPage(language: languageToggle)
                    } label: {
                        ButtonDisplay(text: languageToggle ? "教程" : "Tutorial", image: "questionmark.circle.fill")
                    }
                    
                    NavigationLink{
                        CreditsPage(language: languageToggle)
                    } label: {
                        ButtonDisplay(text: languageToggle ? "信用" : "Credits", image: "command.circle.fill")
                        
                            .font(.system(size: 30))
                            .foregroundColor(Color.darkTeal)
                            .frame(width: 300, height: 40)
                            .background(Color.lightTeal)
                            .cornerRadius(10)
                            .padding(20)
                    }
                }
                .navigationTitle(languageToggle ? "主页" : "Homepage")
                .navigationBarTitleDisplayMode(.inline)
            }
            .ignoresSafeArea(.all)
        }
    }
}

struct ButtonDisplay: View {
    var text: String
    var image: String
    
    var body: some View {
        HStack {
            Text(text)
                .padding()
            Spacer()
            Image(systemName: image)
                .padding()
        }
        .font(.system(size: 30))
        .foregroundColor(Color.white)
        .frame(width: 300, height: 50)
        .background(Color.lightBlue)
        .cornerRadius(10)
        
    }
}

struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePage()
    }
}
