//
//  TodoModel.swift
//  BackLog
//
//  Created by ouyangqi on 2021/8/6.
//

import Foundation
import SwiftUI
import CoreLocation
import Combine

class TodoData: ObservableObject {
    @Published var todos: [TodoModel] = getData()
    @Published var colorArray: [Color] = getColorArray()
}

struct TodoModel: Hashable, Identifiable {
    var id: Int
    var content: String = ""
    var bgColor: Color = Color.random()
    var finish: Bool = false

}

func sort(originArray: [TodoModel]) -> [TodoModel] {
    var unfinishArray = [TodoModel]()
    var finishArray = [TodoModel]()
    for model in originArray {
        if model.finish {
            finishArray.append(model)
        } else {
            unfinishArray.append(model)
        }
    }
//    updateBackLog(array: unfinishArray + finishArray)
    return unfinishArray + finishArray
}

func getColorArray() -> [Color] {
    var array = [Color]()
    for _ in 0..<10 {
        array.append(Color.random())
    }
    return array
}

func getData() -> [TodoModel] {
//    if let arr = UserDefaults.standard.object(forKey: "todos") as? [TodoModel] {
//        return arr
//    }
//    return [TodoModel]()
    var array = [TodoModel]()
    for i in 0..<5 {
        let model = TodoModel(id: i, content: "hhhh" + "\(i)", bgColor: Color.random())
        array.append(model)
    }
    return array
}

func updateBackLog(array: [TodoModel]) {
    UserDefaults.standard.setValue(array, forKey: "todos")
}


func addBackLog(model: TodoModel) {
    if var arr = UserDefaults.standard.object(forKey: "todos") as? [TodoModel] {
        arr.insert(model, at: 0)
        UserDefaults.standard.setValue(arr, forKey: "todos")
    } else {
        var arr = [TodoModel]()
        arr.append(model)
        UserDefaults.standard.setValue(arr, forKey: "todos")
    }
}

func deleteBackLog(model: TodoModel) {
    if var arr = UserDefaults.standard.object(forKey: "todos") as? [TodoModel] {
        for m in arr where m.id == model.id {
            arr.removeAll{ $0 == m }
        }
        UserDefaults.standard.setValue(arr, forKey: "todos")
    }
}
