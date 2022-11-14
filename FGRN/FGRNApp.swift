//
//  FGRNApp.swift
//  FGRN
//
//  Created by NICOLE TAN YITONG stu on 22/10/22.
//

import SwiftUI

@main
struct FGRNApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(InputDataStore())
        }
    }
}
