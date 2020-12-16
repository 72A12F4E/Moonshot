//
//  MoonshotApp.swift
//  Moonshot
//
//  Created by Blake McAnally on 12/16/20.
//

import SwiftUI

@main
struct MoonshotApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MoonshotViewModel())
        }
    }
}
