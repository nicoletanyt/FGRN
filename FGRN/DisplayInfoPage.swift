//
//  DisplayInfoPage.swift
//  FGRN
//
//  Created by FAITH CHONG RUI EN stu on 5/11/22.
//

import SwiftUI

struct DisplayInfoPage: View {
    
    @State var questions = arrayOfQuestions
    @State var isSheetGive = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(.darkTeal)]
        UIScrollView.appearance().backgroundColor = .white
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Basic Info")) {
                    ForEach(0..<3) { question1 in
                        NavigationLink {
                            InfoDetailView(question: $questions[question1])
                        } label: {
                            Text(questions[question1].input)
                        }
                    }
                    .onDelete { indexSet in
                        questions.remove(atOffsets: indexSet)
                    }
                    .onMove { oldOffset, newOffset in
                        questions.move(fromOffsets: oldOffset, toOffset: newOffset)
                    }
                }
                .foregroundColor(.darkTeal)
                .listRowBackground(Color.lightTeal)
                .headerProminence(.increased)
                
                Section(header: Text("Greeting")) {
                    ForEach(4..<9) { question2 in
                        NavigationLink {
                            InfoDetailView(question: $questions[question2])
                        } label: {
                            Text(questions[question2].input)
                        }
                    }
                    .onDelete { indexSet in
                        questions.remove(atOffsets: indexSet)
                    }
                    .onMove { oldOffset, newOffset in
                        questions.move(fromOffsets: oldOffset, toOffset: newOffset)
                    }
                }
                .foregroundColor(.darkTeal)
                .listRowBackground(Color.lightTeal)
                .headerProminence(.increased)
                
                Section(header: Text("Content")) {
                    ForEach(0..<3) { question1 in
                        NavigationLink {
                            InfoDetailView(question: $questions[question1])
                        } label: {
                            Text(questions[question1].input)
                        }
                    }
                    .onDelete { indexSet in
                        questions.remove(atOffsets: indexSet)
                    }
                    .onMove { oldOffset, newOffset in
                        questions.move(fromOffsets: oldOffset, toOffset: newOffset)
                    }
                }
                .foregroundColor(.darkTeal)
                .listRowBackground(Color.lightTeal)
                .headerProminence(.increased)
                
                Section(header: Text("Closing")) {
                    ForEach(0..<3) { question1 in
                        NavigationLink {
                            InfoDetailView(question: $questions[question1])
                        } label: {
                            Text(questions[question1].input)
                        }
                    }
                    .onDelete { indexSet in
                        questions.remove(atOffsets: indexSet)
                    }
                    .onMove { oldOffset, newOffset in
                        questions.move(fromOffsets: oldOffset, toOffset: newOffset)
                    }
                }
                .foregroundColor(.darkTeal)
                .listRowBackground(Color.lightTeal)
                .headerProminence(.increased)
            }
            .listStyle(.sidebar)
            .navigationTitle("Your Final Info")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                        .foregroundColor(.darkTeal)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isSheetGive = true
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.darkTeal)
                    }
                }
            }
        }
        .sheet(isPresented: $isSheetGive) {
            NewInfoSheet(questions: $questions)
        }
    }
}

struct DisplayInfoPage_Previews: PreviewProvider {
    static var previews: some View {
        DisplayInfoPage()
    }
}
