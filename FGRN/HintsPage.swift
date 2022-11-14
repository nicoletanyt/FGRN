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
        if currentquestion == 0 {
            Text("This is a polite greeting depending on the time of day")
        } else if currentquestion == 1 {
            Text("You can enter their name, surname or title (Ms., Mr.)")
        }
        
    }
}

//struct HintsPage_Previews: PreviewProvider {
//    static var previews: some View {
//        HintsPage(question: )
//    }
//}
