//
//  PastInputPage.swift
//  FGRN
//
//  Created by NICOLE TAN YITONG stu on 14/11/22.
//

import SwiftUI

struct PastInputPage: View {
    @EnvironmentObject var inputManager: InputDataStore
    var body: some View {
        List {
            ForEach(inputManager.inputs) { userInputStruct in
                ForEach(userInputStruct.inputQuestion.sorted(by: >), id: \.key) { question, answer in
                    Text(question + answer)
                }
            }
        }
        
        .onAppear {
            inputManager.loadInput()
            print(inputManager.inputs)
        }
    }
}

struct PastInputPage_Previews: PreviewProvider {
    static var previews: some View {
        PastInputPage()
    }
}
