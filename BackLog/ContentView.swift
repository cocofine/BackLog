//
//  ContentView.swift
//  BackLog
//
//  Created by ouyangqi on 2021/8/6.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TodoList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TodoData())
    }
}
