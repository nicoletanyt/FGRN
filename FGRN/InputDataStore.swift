//
//  InputDataStore.swift
//  FGRN
//
//  Created by NICOLE TAN YITONG stu on 14/11/22.
//

import Foundation

class InputDataStore: ObservableObject {
    @Published var inputs: [UserInput] = []
    
    let fileName = "EmailHistory.json"
    
    init() {
        if FileManager().docExist(named: fileName) {
            loadInput()
        }
    }
    
    func addInput(name: String, basicInfo: [Question], greetingInfo: [Question], contentInfo: [Question], closingInfo: [Question]) {
//        inputs.append(UserInput(name: name, input: input, basicInfoNumber: basicInfo, greetingNumber: greeting, contentNumber: content, closingNumber: closing, endNumber: end))
        inputs.append(UserInput(name: name, basicInfo: basicInfo, greetingInfo: greetingInfo, contentInfo: contentInfo, closingInfo: closingInfo))
        saveInput()
    }
//
    func updateInput(_ inputStruct: UserInput) {
        guard let index = inputs.firstIndex(where: { $0.id == inputStruct.id}) else { return }
        inputs[index] = inputStruct
        saveInput()
    }
    
    func deleteInput(at indexSet: IndexSet) {
        inputs.remove(atOffsets: indexSet)
        saveInput()
    }
    
    func loadInput() {
        FileManager().readDocument(docName: fileName) { (result) in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    inputs = try decoder.decode([UserInput].self, from: data)
                } catch {
                    print("Loading Input Error: " + error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func saveInput() {
        print("Saving user input to file system")
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(inputs)
            let jsonString = String(decoding: data, as: UTF8.self)
            FileManager().saveDocument(contents: jsonString, docName: fileName) { (error) in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
