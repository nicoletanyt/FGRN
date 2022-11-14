//
//  InputDataStore.swift
//  FGRN
//
//  Created by NICOLE TAN YITONG stu on 14/11/22.
//

import Foundation

class InputDataStore: ObservableObject {
    @Published var inputs: [[Question]] = []
    
    let fileName = "Inputs.json"
    
    init() {
        if FileManager().docExist(named: fileName) {
            loadInput()
        }
    }
    
    func addInput(_ input: [Question]) {
        inputs.append(input)
        saveInput()
    }
//
//    func updateInput(_ input: Question) {
//        guard let index = inputs.firstIndex(where: { $0.id == input.id}) else { return }
//        inputs[index] = input
//        saveInput()
//    }
    
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
                    inputs = try decoder.decode([[Question]].self, from: data)
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
