//
//  TutorialPage.swift
//  FGRN
//
//  Created by FAITH CHONG RUI EN stu on 29/10/22.
//

import SwiftUI
import FLAnimatedImage

struct TutorialPage: View {
    
    @State var language: Bool
    
    var body: some View {
        VStack {
            Text(language ? "教程。" : "Tutorial.")
                .font(.largeTitle)
                .fontWeight(.black)
                .padding()
            Text(language ? "如何使用该应用程序：" : "How to use the app:")
                .font(.title)
                .padding()
            TabView {
                VStack {
                    Text(language ? "这个应用程序是电子邮件的计划者。" : "This app is a planner for emails.")
                        .font(.title)
                        .padding()
                    GIFView(type: .name("tutorial-1"))
                        .frame(maxWidth: 170, maxHeight: 500)
                        .padding()
                }
                VStack {
                    Text(language ? "把你的答案输入在问题里面，制造你的电邮！" : "There will be questions, input your answers to them to build out your email!")
                        .font(.title)
                        .padding()
                    GIFView(type: .name("tutorial-2"))
                        .frame(maxWidth: 140, maxHeight: 350)
                        .padding()
                }
                VStack {
                    Text(language ? "按“完成”。" : "Press “generate”.")
                        .font(.title)
                        .padding()
                    GIFView(type: .name("tutorial-3"))
                        .frame(maxWidth: 170, maxHeight: 325)
                        .padding()
                }
                VStack {
                    Text(language ? "完了！ 现在你可以使用这些信息来编写您的电子邮件。" : "Done! Now you can use the information to write your email.")
                        .font(.title)
                        .padding()
                    GIFView(type: .name("tutorial-4"))
                        .frame(maxWidth: 170, maxHeight: 500)
                        .padding()
                }
            }
         
            .background(Color.lightTeal)
            .cornerRadius(20)
            .padding(40)
            
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
        }
    }
}

//struct TutorialPage_Previews: PreviewProvider {
//    static var previews: some View {
//        TutorialPage()
//    }
//}
