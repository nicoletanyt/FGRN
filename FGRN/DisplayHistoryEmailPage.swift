//
//  DisplayHistoryEmailPage.swift
//  FGRN
//
//  Created by NICOLE TAN YITONG stu on 16/11/22.
//

import SwiftUI


struct DisplayHistoryEmailPage: View {
    @EnvironmentObject var inputManager: InputDataStore
    @State var inputInfo: UserInput
    @State var language: Bool
    
    @State var isSheetGive = false
    
    @State var isDone = false
    @State var emailName = ""
    
    
    @State var basicInfoNumber = 0
    @State var greetingNumber = 4
    @State var contentNumber = 6
    @State var closingNumber = 14
    @State var endNumber = 16
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text(language ? "基本信息" : "Basic Info")) {
                    ForEach(0..<4) { question1 in
                        NavigationLink {
                            InfoDetailView(question: $inputInfo.input[question1])
                        } label: {
                            Text(inputInfo.input[question1].input)
                        }
                    }
                    .onDelete { indexSet in
                        inputInfo.input.remove(atOffsets: indexSet)
                    }
                    .onMove { oldOffset, newOffset in
                        inputInfo.input.move(fromOffsets: oldOffset, toOffset: newOffset)
                    }
                }
                .foregroundColor(.textColor)
                .listRowBackground(Color.lightTeal)
                
                Section(header: Text(language ? "问候语" : "Greeting")) {
                    ForEach(4..<6) { question2 in
                        NavigationLink {
                            InfoDetailView(question: $inputInfo.input[question2])
                        } label: {
                            Text(inputInfo.input[question2].input)
                        }
                    }
                    .onDelete { indexSet in
                        inputInfo.input.remove(atOffsets: indexSet)
                    }
                    .onMove { oldOffset, newOffset in
                        inputInfo.input.move(fromOffsets: oldOffset, toOffset: newOffset)
                    }
                }
                .foregroundColor(.textColor)
                .listRowBackground(Color.lightTeal)
                
                Section(header: Text(language ? "内容" : "Content")) {
                    ForEach(6..<14) { question3 in
                        NavigationLink {
                            InfoDetailView(question: $inputInfo.input[question3])
                        } label: {
                            Text(inputInfo.input[question3].input)
                        }
                    }
                    .onDelete { indexSet in
                        inputInfo.input.remove(atOffsets: indexSet)
                    }
                    .onMove { oldOffset, newOffset in
                        inputInfo.input.move(fromOffsets: oldOffset, toOffset: newOffset)
                    }
                }
                .foregroundColor(.textColor)
                .listRowBackground(Color.lightTeal)
                
                Section(header: Text(language ? "闭幕" : "Closing")) {
                    ForEach(14..<16) { question4 in
                        NavigationLink {
                            InfoDetailView(question: $inputInfo.input[question4])
                        } label: {
                            Text(inputInfo.input[question4].input)
                        }
                    }
                    .onDelete { indexSet in
                        inputInfo.input.remove(atOffsets: indexSet)
                    }
                    .onMove { oldOffset, newOffset in
                        inputInfo.input.move(fromOffsets: oldOffset, toOffset: newOffset)
                    }
                }
                .foregroundColor(.textColor)
                .listRowBackground(Color.lightTeal)
                
                Button("Done") {
                    isDone = true
                    inputManager.updateInput(inputInfo)
                    dismiss()
                }
            }
            .interactiveDismissDisabled(!isDone)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                        .foregroundColor(.textColor)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isSheetGive = true
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.textColor)
                    }
                }
            }
            .navigationBarTitle(inputInfo.name)
            //        }
            .sheet(isPresented: $isSheetGive) {
//                NewInfoSheet(questions: $inputInfo.input, typeString: "love")
                NewInfoSheet(infos: "", questions: $inputInfo.input, BasicInfo: $basicInfoNumber, Greeting: $greetingNumber, Content: $contentNumber, Closing:  $closingNumber, End: $endNumber, typeString: "")

            }
        }
    }
}
