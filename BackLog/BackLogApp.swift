//
//  BackLogApp.swift
//  BackLog
//
//  Created by ouyangqi on 2021/8/6.
//

import SwiftUI

@main
struct BackLogApp: App {
    
    @StateObject private var todoData = TodoData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(todoData)
        }
    }
}
