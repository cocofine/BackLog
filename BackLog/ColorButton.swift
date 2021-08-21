//
//  ColorButton.swift
//  BackLog
//
//  Created by ouyangqi on 2021/8/7.
//

import SwiftUI

struct ColorButton: View {
    
    @State var isSet: Bool
    @Binding var index: Int
    var currentColor = Color.random()
    
    
    var body: some View {

        Button(action: {
            isSet = !isSet
//            index = index
        })
        {
            let num: CGFloat = isSet ? 3 : 0
            currentColor
                .frame(width: 30, height: 30)
                .cornerRadius(15)
                .overlay(Circle().stroke(Color.white, lineWidth: num))
                .shadow(radius: num
                )
        }

    }
}

struct ColorButton_Previews: PreviewProvider {
    static var previews: some View {
        ColorButton(isSet: false, index: .constant(0))
    }
}
