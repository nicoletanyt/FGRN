//
//  DisplayInfoPage.swift
//  FGRN
//
//  Created by FAITH CHONG RUI EN stu on 5/11/22.
//

import SwiftUI

struct DisplayInfoPage: View {
    @EnvironmentObject var inputManager: InputDataStore
    @State var questionsArray: [Question]
    @State var isSheetGive = false
    @State var language: Bool
    
    @State private var isDone = false
    @State var isShowAlert = false
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
                    ForEach((basicInfoNumber ..< greetingNumber), id: \.self) { question1 in
                        NavigationLink {
                            InfoDetailView(question: $questionsArray[question1])
                        } label: {
                            Text(questionsArray[question1].input)
                        }
                    }
                    .onDelete { indexSet in
                        questionsArray.remove(atOffsets: indexSet)
                    }
                    .onMove { oldOffset, newOffset in
                        questionsArray.move(fromOffsets: oldOffset, toOffset: newOffset)
                    }
                }
                .foregroundColor(.textColor)
                .listRowBackground(Color.lightTeal)
                
                Section(header: Text(language ? "问候语" : "Greeting")) {
                    ForEach(greetingNumber ..< contentNumber, id: \.self) { question2 in
                        NavigationLink {
                            InfoDetailView(question: $questionsArray[question2])
                        } label: {
                            Text(questionsArray[question2].input)
                        }
                    }
                    .onDelete { indexSet in
                        questionsArray.remove(atOffsets: indexSet)
                    }
                    .onMove { oldOffset, newOffset in
                        questionsArray.move(fromOffsets: oldOffset, toOffset: newOffset)
                    }
                }
                .foregroundColor(.textColor)
                .listRowBackground(Color.lightTeal)
                
                Section(header: Text(language ? "内容" : "Content")) {
                    ForEach(contentNumber ..< closingNumber, id: \.self) { question3 in
                        NavigationLink {
                            InfoDetailView(question: $questionsArray[question3])
                        } label: {
                            Text(questionsArray[question3].input)
                        }
                    }
                    .onDelete { indexSet in
                        questionsArray.remove(atOffsets: indexSet)
                    }
                    .onMove { oldOffset, newOffset in
                        questionsArray.move(fromOffsets: oldOffset, toOffset: newOffset)
                    }
                }
                .foregroundColor(.textColor)
                .listRowBackground(Color.lightTeal)
                
                Section(header: Text(language ? "结束" : "Closing")) {
                    ForEach(closingNumber ..< endNumber, id: \.self) { question4 in
                        NavigationLink {
                            InfoDetailView(question: $questionsArray[question4])
                        } label: {
                            Text(questionsArray[question4].input)
                        }
                    }
                    .onDelete { indexSet in
                        questionsArray.remove(atOffsets: indexSet)
                    }
                    .onMove { oldOffset, newOffset in
                        questionsArray.move(fromOffsets: oldOffset, toOffset: newOffset)
                    }
                }
                .foregroundColor(.textColor)
                .listRowBackground(Color.lightTeal)
                
                Button("Done") {
                    isDone = true
                    isShowAlert = true
                }
                .alert("Enter a name for saving this email.", isPresented: $isShowAlert, actions: {
                    TextField("Name", text: $emailName)
                    
                    Button("Save", action: {
                        inputManager.addInput(name: emailName, input: questionsArray)
                        dismiss()
                    })
                    Button("Cancel", role: .cancel, action: {
                        dismiss()
                    })
                }, message: {
                    Text("Press Cancel if you do not want to save it.")
                })
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
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        UIPasteboard.general.strings = [questionsArray[0].input, questionsArray[1].input, questionsArray[2].input, questionsArray[3].input, questionsArray[4].input, questionsArray[5].input, questionsArray[6].input, questionsArray[7].input, questionsArray[8].input, questionsArray[9].input, questionsArray[10].input, questionsArray[11].input, questionsArray[12].input, questionsArray[13].input, questionsArray[14].input, questionsArray[15].input]
                    } label: {
                        Image(systemName: "doc.on.doc")
                            .foregroundColor(.textColor)
                    }
                }
            }
            .navigationBarTitle("Your Final Info")
            .sheet(isPresented: $isSheetGive) {
                NewInfoSheet(infos: "", questions: $questionsArray, BasicInfo: $basicInfoNumber, Greeting: $greetingNumber, Content: $contentNumber, Closing: $closingNumber, End: $endNumber, typeString: "")
            }
        }
    }
}
