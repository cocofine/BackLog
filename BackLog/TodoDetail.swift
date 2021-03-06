//
//  TodoDetail.swift
//  BackLog
//
//  Created by ouyangqi on 2021/8/6.
//

import SwiftUI

struct TodoDetail: View {
    
    var todo: TodoModel
    
    @EnvironmentObject var data: TodoData
    @Environment(\.presentationMode) var presentationMode
    var colors: [String] {
        var colors = data.colorArray
        colors.removeFirst()
        colors.insert(todo.bgColor, at: 0)
        return colors
    }
    var currentIndex: Int {
        data.todos.firstIndex(where: { $0.id == todo.id })!
    }
    
    static var count = 10
    
    @State private var isSet: Bool = false
    @State private var index = 0
    @State var finish: Bool
    
    var body: some View {

        VStack {
            
            Button(action:{
                self.presentationMode.wrappedValue.dismiss()
            })
            {
                Text("Back")
            }
            
            Button(action: {
                finish = !finish
                data.todos[currentIndex].finish = finish
                
            }){
                Image(systemName: finish ? "checkmark.circle.fill" : "circle")
                    .imageScale(.large)
                    .foregroundColor(finish ? Color.blue : Color.gray)
                    .padding()
                    .frame(width: 100, height: 100)
            }
            
            HStack {
                ForEach(0..<TodoDetail.count) { i in
                    let num: CGFloat = index == i ? 3 : 0
                    Button(action: {
                        isSet = !isSet
                        index = i
                        data.todos[currentIndex].bgColor = colors[i]
                    }) {
                        Color.colorWithHex(colors[i], 0.5)
                    }
                    .frame(width: 30, height: 30)
                    .cornerRadius(15)
                    .overlay(Circle().stroke(Color.white, lineWidth: num))
                    .shadow(radius: num)
                    
                }
            }
            .padding()
            

            
            TextField("?????????", text: $data.todos[currentIndex].content, onEditingChanged: { (value) in
//                data.todos[currentIndex].content = text
                //??????????????????????????????????????????????????????????????????????????????????????????????????????????????????
            }) {
                 //????????????????????????????????????????????????????????????username????????????
                
            }
            .frame(width: UIScreen.main.bounds.width - 40, height: 300, alignment: .topLeading)
            .font(.largeTitle)
            .padding(20)
            .lineLimit(4)
            .background(Color.colorWithHex(data.todos[currentIndex].bgColor, 0.5))
            
        }
        
        
        
    }
}

struct TodoDetail_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetail(todo: TodoModel(id: 0, content: "", bgColor: "#2db7b5"), finish: false)
            .environmentObject(TodoData())
    }
}
