//
//  CreditsPage.swift
//  FGRN
//
//  Created by FAITH CHONG RUI EN stu on 29/10/22.
//

import SwiftUI

struct CreditsPage: View {
    @State var language: Bool
    

    var body: some View {
        Image(systemName: "command.circle.fill")
                     .imageScale(.large)
                     .foregroundColor(Color.lightBlue)
                     .font(.system(size: 24, design: .monospaced))
                     .padding()
                 Text(language ? "由 Four-Grand-Rush-Nights 开发" : "Developed By Four-Grand-Rush-Nights")
            .foregroundColor(Color.lightBlue)
                     .bold()
                     .font(.system(size: 24, design: .monospaced))
                     .padding()
                 
                 Text(language ? "\"请不要再偷走我的孩子。\"" : "\"Please don't steal my kids again.\"")
            .foregroundColor(Color.lightBlue)
                     .bold()
                     .padding()
    }
}
//
//struct CreditsPage_Previews: PreviewProvider {
//    static var previews: some View {
//        CreditsPage()
//    }
//}
