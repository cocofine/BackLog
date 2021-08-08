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
    var colors: [Color] {
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
    
    
    var body: some View {

        VStack {
            
            Button(action: {
                data.todos[currentIndex].finish = !data.todos[currentIndex].finish
                
            }){
                Image(systemName: data.todos[currentIndex].finish ? "checkmark.circle.fill" : "circle")
                    .imageScale(.large)
                    .foregroundColor(data.todos[currentIndex].finish ? Color.blue : Color.gray)
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
                        colors[i]
                    }
                    .frame(width: 30, height: 30)
                    .cornerRadius(15)
                    .overlay(Circle().stroke(Color.white, lineWidth: num))
                    .shadow(radius: num)
                    
                }
            }
            .padding()
            

            
            TextField("请输入", text: $data.todos[currentIndex].content, onEditingChanged: { (value) in
//                data.todos[currentIndex].content = text
                //当用户修改文本输入框里的内容时，在控制台输出属性的值，实时观察属性的值的变化
            }) {
                 //当用户完成文本框里的输入时，在控制台输出username属性的值
                
            }
            .frame(width: UIScreen.main.bounds.width - 40, height: 300, alignment: .topLeading)
            .font(.largeTitle)
            .padding(20)
            .lineLimit(4)
            .background(data.todos[currentIndex].bgColor.opacity(0.5))
            
        }
        
        
        
    }
}

struct TodoDetail_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetail(todo: TodoModel(id: 0, content: "", bgColor: Color.random()))
            .environmentObject(TodoData())
    }
}
