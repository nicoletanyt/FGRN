//
//  FileManager.swift
//  FGRN
//
//  Created by NICOLE TAN YITONG stu on 14/11/22.
//

import Foundation
import UIKit

extension FileManager {
    static var docDirURL: URL {
        return Self.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    //For Clothes
    func saveDocument(contents: String, docName: String, completion: (Error?) -> Void) {
        let url = Self.docDirURL.appendingPathComponent(docName)
        do {
            try contents.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            completion(error)
        }
    }
    
    func readDocument(docName: String, completion: (Result<Data, Error>) -> Void) {
        let url = Self.docDirURL.appendingPathComponent(docName)
        do {
            let data = try Data(contentsOf: url)
            completion(.success(data))
        } catch {
            completion(.failure(error))
        }
    }
    
    func docExist(named docName: String) -> Bool {
        fileExists(atPath: Self.docDirURL.appendingPathComponent(docName).path)
    }
}
