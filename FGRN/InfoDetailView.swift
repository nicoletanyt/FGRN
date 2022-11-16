//
//  InfoDetailView.swift
//  FGRN
//
//  Created by FAITH CHONG RUI EN stu on 5/11/22.
//

import SwiftUI

struct InfoDetailView: View {
    
    @Binding var question: Question
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                TextField("reenter your info", text: $question.input)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                Button("save info") {
                    dismiss()
                }
            }
        }
        .navigationBarHidden(true)
    }
}
