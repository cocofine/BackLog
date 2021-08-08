//
//  TodoList.swift
//  BackLog
//
//  Created by ouyangqi on 2021/8/6.
//

import SwiftUI

struct TodoList: View {
    
    @EnvironmentObject var data: TodoData
    var todoArray: [TodoModel] {
        sort(originArray: data.todos)
    }
    
    var body: some View {
        
        
        NavigationView {
            
            ZStack {
                
                List {
                    ForEach(todoArray) { todo in
                        NavigationLink(destination:TodoDetail(todo: todo)) {
                            TodoItem(todo: todo)
                        }
                    }
                }
                .navigationTitle("BackLog")
                .onAppear {
                    data.todos = sort(originArray: data.todos)
                }
                
                
                
                Button(action: {
                    let model = TodoModel(id: data.todos.count)
                    data.todos.append(model)
                }) {
                    ZStack {
                        Group {
                            Circle()
                                .fill(Color("btnAdd-bg"))
                        }.frame(width: 65.0, height: 65.0)
                            .shadow(color: Color("btnAdd-shadow"), radius: 10)

                        Group {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 65.0, height: 65.0)
                                .foregroundColor(Color("theme"))
                        }
                    }
                }
                .offset(x: 0, y: UIScreen.main.bounds.height/2 - 150)
            }
            
            

            
        }
            
            



        
            

        

        


    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        TodoList()
            .environmentObject(TodoData())
    }
}
