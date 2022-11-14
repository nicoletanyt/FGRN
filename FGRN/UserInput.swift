//
//  UserInput.swift
//  FGRN
//
//  Created by NICOLE TAN YITONG stu on 14/11/22.
//

import Foundation

struct UserInput: Identifiable, Codable {
    var id = UUID()
    
    var inputQuestion: [String: String]
}
