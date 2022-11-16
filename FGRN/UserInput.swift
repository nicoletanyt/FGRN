//
//  UserInput.swift
//  FGRN
//
//  Created by NICOLE TAN YITONG stu on 16/11/22.
//

import Foundation

struct UserInput: Identifiable, Codable, Hashable {
    var id = UUID()
    var name: String
    
    var input: [Question] //input from the questions struct
}
