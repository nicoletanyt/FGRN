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
    
    @State var inputCopy: [String] = [] //stuff to be copied
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text(language ? "基本信息" : "Basic Info")) {
                    ForEach(0..<inputInfo.basicInfo.count, id: \.self) { infoIndex in
                        NavigationLink {
                            InfoDetailView(question: $inputInfo.basicInfo[infoIndex])
                        } label: {
                            Text(inputInfo.basicInfo[infoIndex].input)
                        }
                    }
                    .onDelete { indexSet in
                        inputInfo.basicInfo.remove(atOffsets: indexSet)
                    }
                    .onMove { oldOffset, newOffset in
                        inputInfo.basicInfo.move(fromOffsets: oldOffset, toOffset: newOffset)
                    }
                }
                .foregroundColor(.textColor)
                .listRowBackground(Color.lightTeal)
                
                Section(header: Text(language ? "问候语" : "Greeting")) {
                    ForEach(0..<inputInfo.greetingInfo.count, id: \.self) { greetingIndex in
                        NavigationLink {
                            InfoDetailView(question: $inputInfo.greetingInfo[greetingIndex])
                        } label: {
                            Text(inputInfo.greetingInfo[greetingIndex].input)
                        }
                    }
                    .onDelete { indexSet in
                        inputInfo.greetingInfo.remove(atOffsets: indexSet)
                    }
                    .onMove { oldOffset, newOffset in
                        inputInfo.greetingInfo.move(fromOffsets: oldOffset, toOffset: newOffset)
                    }
                }
                .foregroundColor(.textColor)
                .listRowBackground(Color.lightTeal)

                Section(header: Text(language ? "内容" : "Content")) {
                    ForEach(0 ..< inputInfo.contentInfo.count, id: \.self) { contentIndex in
                        NavigationLink {
                            InfoDetailView(question: $inputInfo.contentInfo[contentIndex])
                        } label: {
                            Text(inputInfo.contentInfo[contentIndex].input)
                        }
                    }
                    .onDelete { indexSet in
                        inputInfo.contentInfo.remove(atOffsets: indexSet)
                    }
                    .onMove { oldOffset, newOffset in
                        inputInfo.contentInfo.move(fromOffsets: oldOffset, toOffset: newOffset)
                    }
                }
                .foregroundColor(.textColor)
                .listRowBackground(Color.lightTeal)

                Section(header: Text(language ? "结束" : "Closing")) {
                    ForEach(0 ..< inputInfo.closingInfo.count, id: \.self) { closingIndex in
                        NavigationLink {
                            InfoDetailView(question: $inputInfo.closingInfo[closingIndex])
                        } label: {
                            Text(inputInfo.closingInfo[closingIndex].input)
                        }
                    }
                    .onDelete { indexSet in
                        inputInfo.closingInfo.remove(atOffsets: indexSet)
                    }
                    .onMove { oldOffset, newOffset in
                        inputInfo.closingInfo.move(fromOffsets: oldOffset, toOffset: newOffset)
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
            .toolbar(content: {
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
                        for i in inputInfo.basicInfo + inputInfo.greetingInfo + inputInfo.contentInfo + inputInfo.closingInfo {
                            inputCopy.append(i.input)
                        }
                        UIPasteboard.general.strings = inputCopy
                    } label: {
                        Image(systemName: "doc.on.doc")
                            .foregroundColor(.textColor)
                    }
                }
            })
            .navigationBarTitle(inputInfo.name)
            .sheet(isPresented: $isSheetGive) {
                NewInfoSheet(basicInfo: $inputInfo.basicInfo, greetingInfo: $inputInfo.greetingInfo, contentInfo: $inputInfo.contentInfo, closingInfo: $inputInfo.closingInfo, typeString: "")
            }
        }
        
    }
}
