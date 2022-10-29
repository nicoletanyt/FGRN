//
//  TutorialPage.swift
//  FGRN
//
//  Created by FAITH CHONG RUI EN stu on 29/10/22.
//

import SwiftUI

struct TutorialPage: View {
    var body: some View {
        VStack {
            Text("Welcome.")
                .font(.largeTitle)
                .fontWeight(.black)
            Text("How to use the app:")
                .font(.title)
                .padding()
            TabView {
                VStack {
                    Text("This app is a planner for emails.")
                        .font(.title)
                        .padding()
                }
                VStack {
                    Text("There will be questions, input your answers to them to build out your email!")
                        .font(.title)
                        .padding()
                }
                VStack {
                    Text("Press “generate”.")
                        .font(.title)
                        .padding()
                }
                VStack {
                    Text("Done! Now you can use the information to write your email.")
                        .font(.title)
                        .padding()
                    Button {
                        // go to welcome page
                    } label: {
                        Text("Welcome Page")
                        Image(systemName: "chevron.right")
                    }
                    .font(.title2)
                    .foregroundColor(.black)
                }
            }
         
            .background(.cyan)
            .cornerRadius(20)
            .padding(40)
            
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
        }
    }
}

struct TutorialPage_Previews: PreviewProvider {
    static var previews: some View {
        TutorialPage()
    }
}
