//
//  DisplayInfoPage.swift
//  FGRN
//
//  Created by FAITH CHONG RUI EN stu on 5/11/22.
//

import SwiftUI

struct DisplayInfoPage: View {
    @EnvironmentObject var inputManager: InputDataStore
//    @State var questionsArray: [Question]
    @State var isSheetGive = false
    @State var language: Bool
    @State var welcomePageActive2: Bool = false
    @State var isActive2: Bool = false
    
    //    init() {
    //        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(.darkTeal)]
    //        UIScrollView.appearance().backgroundColor = .white
    //    }
    
    @State private var isDone = false
    @State var isShowAlert = false
    @State var emailName = ""
    @State var page: String = ""
    
    @State var basicInfo: [Question]
    @State var greetingInfo: [Question]
    @State var contentInfo: [Question]
    @State var closingInfo: [Question]
    
    @State var inputCopy: [String] = [] //stuff to be copied
    
    @Binding var welcomePageActive: Bool
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text(language ? "基本信息" : "Basic Info")) {
                    ForEach(0..<basicInfo.count, id: \.self) { infoIndex in
                        NavigationLink {
                            InfoDetailView(question: $basicInfo[infoIndex])
                        } label: {
                            Text(basicInfo[infoIndex].input)
                        }
                    }
                    .onDelete { indexSet in
                        basicInfo.remove(atOffsets: indexSet)
                    }
                    .onMove { oldOffset, newOffset in
                        basicInfo.move(fromOffsets: oldOffset, toOffset: newOffset)
                    }
                }
                .foregroundColor(.textColor)
                .listRowBackground(Color.lightTeal)
                
                Section(header: Text(language ? "问候语" : "Greeting")) {
                    ForEach(0..<greetingInfo.count, id: \.self) { greetingIndex in
                        NavigationLink {
                            InfoDetailView(question: $greetingInfo[greetingIndex])
                        } label: {
                            Text(greetingInfo[greetingIndex].input)
                        }
                    }
                    .onDelete { indexSet in
                        greetingInfo.remove(atOffsets: indexSet)
                    }
                    .onMove { oldOffset, newOffset in
                        greetingInfo.move(fromOffsets: oldOffset, toOffset: newOffset)
                    }
                }
                .foregroundColor(.textColor)
                .listRowBackground(Color.lightTeal)

                Section(header: Text(language ? "内容" : "Content")) {
                    ForEach(0 ..< contentInfo.count, id: \.self) { contentIndex in
                        NavigationLink {
                            InfoDetailView(question: $contentInfo[contentIndex])
                        } label: {
                            Text(contentInfo[contentIndex].input)
                        }
                    }
                    .onDelete { indexSet in
                        contentInfo.remove(atOffsets: indexSet)
                    }
                    .onMove { oldOffset, newOffset in
                        contentInfo.move(fromOffsets: oldOffset, toOffset: newOffset)
                    }
                }
                .foregroundColor(.textColor)
                .listRowBackground(Color.lightTeal)

                Section(header: Text(language ? "结束" : "Closing")) {
                    ForEach(0 ..< closingInfo.count, id: \.self) { closingIndex in
                        NavigationLink {
                            InfoDetailView(question: $closingInfo[closingIndex])
                        } label: {
                            Text(closingInfo[closingIndex].input)
                        }
                    }
                    .onDelete { indexSet in
                        closingInfo.remove(atOffsets: indexSet)
                    }
                    .onMove { oldOffset, newOffset in
                        closingInfo.move(fromOffsets: oldOffset, toOffset: newOffset)
                    }
                }
                .foregroundColor(.textColor)
                .listRowBackground(Color.lightTeal)
                
                Button(language ? "完" : "Done") {
                    isDone = true
                    isShowAlert = true
                }
                .alert(language ? "输入保存此电子邮件的名称。" : "Enter a name for saving this email.", isPresented: $isShowAlert, actions: {
                    TextField(language ? "名字" : "Name", text: $emailName)
                    
                    Button(language ? "保存" : "Save", action: {
                        inputManager.addInput(name: emailName, basicInfo: basicInfo, greetingInfo: greetingInfo, contentInfo: contentInfo, closingInfo: closingInfo)
                        welcomePageActive = false
                        dismiss()
                    })
                    Button(language ? "取消" : "Cancel", role: .cancel, action: {
//                        welcomePageActive = false
//                        .cancel()
                    })
                }, message: {
                    Text(language ? "如果不想保存，请按取消。" : "Press Cancel if you do not want to save it.")
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
                        for i in basicInfo + greetingInfo + contentInfo + closingInfo {
                            inputCopy.append(i.input)
                        }
                        UIPasteboard.general.strings = inputCopy
                        
//                        UIPasteboard.general.strings = [questionsArray[0].input, questionsArray[1].input, questionsArray[2].input, questionsArray[3].input, questionsArray[4].input, questionsArray[5].input, questionsArray[6].input, questionsArray[7].input, questionsArray[8].input, questionsArray[9].input, questionsArray[10].input, questionsArray[11].input, questionsArray[12].input, questionsArray[13].input, questionsArray[14].input, questionsArray[15].input]
                    } label: {
                        Image(systemName: "doc.on.doc")
                            .foregroundColor(.textColor)
                    }
                }
            }
            .navigationBarTitle(language ? "您的最终信息" : "Your Final Info")
            //        }
            .sheet(isPresented: $isSheetGive) {
                NewInfoSheet(basicInfo: $basicInfo, greetingInfo: $greetingInfo, contentInfo: $contentInfo, closingInfo: $closingInfo, typeString: "")
            }
        }
    }
}
