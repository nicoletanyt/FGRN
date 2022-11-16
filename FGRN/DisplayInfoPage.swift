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
    //    init() {
    //        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(.darkTeal)]
    //        UIScrollView.appearance().backgroundColor = .white
    //    }
    
    @State private var isDone = false
    @State var isShowAlert = false
    @State var emailName = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            //        NavigationView {
            List {
                Section(header: Text(language ? "基本信息" : "Basic Info")) {
                    ForEach(0..<4) { question1 in
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
                    ForEach(4..<6) { question2 in
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
                    ForEach(6..<14) { question3 in
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
                
                Section(header: Text(language ? "闭幕" : "Closing")) {
                    ForEach(14..<16) { question4 in
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
            }
            .navigationBarTitle("Your Final Info")
            //        }
            .sheet(isPresented: $isSheetGive) {
                NewInfoSheet(questions: $questionsArray, typeString: "love you")
            }
        }
    }
}
