//
//  TodoDetail.swift
//  BackLog
//
//  Created by ouyangqi on 2021/8/6.
//

import SwiftUI

struct TodoDetail: View {
    
    var todo: TodoModel
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var data: TodoData
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
    
    @State var index: Int
    @State var finish: Bool
        
    var body: some View {

        VStack {
            
            Button(action:{
                self.presentationMode.wrappedValue.dismiss()
//                data.todos.remove(at: currentIndex)
//                deleteBackLog(model: data.todos[currentIndex])
            })
            {
                Text("Delete")
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
                    ColorButton(isSet: .constant(index == i), index: i, currentColor: colors[i], current: $index, currentItem: currentIndex)
                }
                
                Button(action:{
                    
                })
                {
                    let str = String(index)
                    Text(str)
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
            .background(Color.colorWithHex(data.todos[currentIndex].bgColor, 0.5))
            
        }
        
        
        
    }
}

struct TodoDetail_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetail(todo: TodoModel(id: 0, content: "", bgColor: "#2db7b5"), index: 0, finish: false)
            .environmentObject(TodoData())
    }
}
