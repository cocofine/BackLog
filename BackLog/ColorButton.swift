//
//  ColorButton.swift
//  BackLog
//
//  Created by ouyangqi on 2021/8/7.
//

import SwiftUI

struct ColorButton: View {
    @EnvironmentObject var data: TodoData
    @Binding var isSet: Bool
    var index: Int
    var currentColor: String
    @Binding var current: Int
    var currentItem: Int
    
    
    var body: some View {

        Button(action: {
            isSet = !isSet
            current = index
            data.todos[currentItem].bgColor = currentColor
        }) {
            Color.colorWithHex(currentColor, 0.5)
        }
        .frame(width: 30, height: 30)
        .cornerRadius(15)
        .overlay(Circle().stroke(Color.white, lineWidth: isSet ? 3 : 0))
        .shadow(radius: isSet ? 3 : 0)
        
    }
}

struct ColorButton_Previews: PreviewProvider {
    static var previews: some View {
        ColorButton(isSet: .constant(false), index: 0, currentColor: "#2db7b5", current: .constant(0), currentItem: 0)
    }
}
