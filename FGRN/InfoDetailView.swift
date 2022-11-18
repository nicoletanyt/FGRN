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
                if #available(iOS 16.0, *) {
                    TextField("reenter your info", text: $question.input, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                } else {
                    // Fallback on earlier versions
                }
                Button("save info") {
                    dismiss()
                }
            }
        }
        .navigationBarHidden(true)
    }
}
