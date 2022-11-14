//
//  HintsPage.swift
//  FGRN
//
//  Created by FAITH CHONG RUI EN stu on 5/11/22.
//

import SwiftUI

struct HintsPage: View {
    @State var currentquestion: Int
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        if currentquestion == 15 {
            Text("hello")
        } else {
            Text("help")
        }
        
    }
}

//struct HintsPage_Previews: PreviewProvider {
//    static var previews: some View {
//        HintsPage(question: )
//    }
//}
