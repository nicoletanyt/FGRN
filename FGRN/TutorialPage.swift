//
//  TutorialPage.swift
//  FGRN
//
//  Created by FAITH CHONG RUI EN stu on 29/10/22.
//

import SwiftUI

struct TutorialPage: View {
    
    @State var language: Bool
    
//    init() {
//        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color.darkTeal)
//        UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color.lightBlue)
//     }
    
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
                }
                VStack {
                    Text(language ? "会有问题，输入你的答案来建立你的电子邮件！" : "There will be questions, input your answers to them to build out your email!")
                        .font(.title)
                        .padding()
                }
                VStack {
                    Text(language ? "按“生成”。" : "Press “generate”.")
                        .font(.title)
                        .padding()
                }
                VStack {
                    Text(language ? "完毕！ 现在您可以使用这些信息来编写您的电子邮件。" : "Done! Now you can use the information to write your email.")
                        .font(.title)
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
