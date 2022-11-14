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
            ForEach(inputManager.inputs, id: \.self) { inputStruct in
                NavigationLink {
                    DisplayInfoPage(questionsArray: inputStruct)
                } label: {
                    Text("Recent")
                }
            }
            .onDelete { indexSet in
                    inputManager.inputs.remove(atOffsets: indexSet)
            }
            .onMove { oldOffset, newOffset in
                inputManager.inputs.move(fromOffsets: oldOffset, toOffset: newOffset)
            }
        }
        .navigationTitle("Email History")
        .onAppear {
            inputManager.loadInput()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
                    .foregroundColor(.textColor)
            }
        }
    }
}

struct PastInputPage_Previews: PreviewProvider {
    static var previews: some View {
        PastInputPage()
    }
}
