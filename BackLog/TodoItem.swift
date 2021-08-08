//
//  TodoItem.swift
//  BackLog
//
//  Created by ouyangqi on 2021/8/6.
//

import SwiftUI

struct TodoItem: View {
    
    @EnvironmentObject var data: TodoData
    var currentIndex: Int {
        data.todos.firstIndex(where: { $0.id == todo.id })!
    }
    
    var todo: TodoModel
        
    var body: some View {

        HStack {
            Image(systemName: "face.smiling.fill")
                .foregroundColor(.yellow)
                .padding()
            Text(todo.content)
                .padding()
                Spacer()
            
            Button(action: {
//                isChoise = !isChoise
                
            }){
                Image(systemName: data.todos[currentIndex].finish ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(data.todos[currentIndex].finish ? Color.blue : Color.gray)
                    .padding()
            }
        }
        .background(data.todos[currentIndex].bgColor.opacity(0.5))
        
    }
}

struct TodoItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TodoItem(todo: TodoModel(id: 0, content: "", bgColor: Color.random()))
                .environmentObject(TodoData())
        }
        .previewLayout(.fixed(width: 300, height: 100))

    }
}
