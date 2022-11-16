//
//  InfoDetailView.swift
//  FGRN
//
//  Created by FAITH CHONG RUI EN stu on 5/11/22.
//

import SwiftUI

struct InfoDetailView: View {
    
    @Binding var question: Question
    
    var body: some View {
        Form {
            TextField("reenter your info", text: $question.input)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
            Button {
                
            } label: {
                
            }
        }
    }
}
