//
//  CreditsPage.swift
//  FGRN
//
//  Created by FAITH CHONG RUI EN stu on 29/10/22.
//

import SwiftUI

struct CreditsPage: View {
    var body: some View {
        Image(systemName: "command.circle.fill")
                     .imageScale(.large)
                     .foregroundColor(Color.lightBlue)
                     .font(.system(size: 24, design: .monospaced))
                     .padding()
                 Text("Developed By Four-Grand-Rush-Nights")
            .foregroundColor(Color.lightBlue)
                     .bold()
                     .font(.system(size: 24, design: .monospaced))
                     .padding()
                 

                 Text("\"Please don't steal my kids again.\"")
            .foregroundColor(Color.lightBlue)
                     .bold()
                     .padding()
    }
}

struct CreditsPage_Previews: PreviewProvider {
    static var previews: some View {
        CreditsPage()
    }
}
