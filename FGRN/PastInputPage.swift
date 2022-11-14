//
//  PastInputPage.swift
//  FGRN
//
//  Created by NICOLE TAN YITONG stu on 14/11/22.
//

import SwiftUI

struct PastInputPage: View {
    @State var language: Bool
    @EnvironmentObject var inputManager: InputDataStore
    var body: some View {
        List {
            ForEach(inputManager.inputs, id: \.self) { inputStruct in
                NavigationLink {
                    DisplayInfoPage(questionsArray: inputStruct, language: language)
                } label: {
                    Text("Recent")
                }
            }
        }
        .navigationTitle("Email History")
        
        .onAppear {
            inputManager.loadInput()
        }
    }
}

struct PastInputPage_Previews: PreviewProvider {
    static var previews: some View {
        PastInputPage(language: false)
    }
}
