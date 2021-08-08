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
    @Published var colorArray: [String] = getColorArray()
}

struct TodoModel: Hashable, Identifiable, Codable {
    var id: Int
    var content: String = ""
    var bgColor: String = getSixteenNum()
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
    updateBackLog(array: unfinishArray + finishArray)
    return unfinishArray + finishArray
}

func getColorArray() -> [String] {
    var array = [String]()
    for _ in 0..<10 {
        array.append(getSixteenNum())
    }
    return array
}

func getSixteenNum() -> String {
    var str = "#"
    for _ in 0..<6 {
        let a = arc4random() % 16
        if a == 10 {
            str.append("A")
        } else if a == 11 {
            str.append("B")
        } else if a == 12 {
            str.append("C")
        } else if a == 13 {
            str.append("D")
        } else if a == 14 {
            str.append("E")
        } else if a == 15 {
            str.append("F")
        } else {
            str.append("\(a)")
        }
    }
    return str
}

func getData() -> [TodoModel] {
    if let data = UserDefaults.standard.value(forKey:"todos") as? Data, let arr = try? PropertyListDecoder().decode(Array<TodoModel>.self, from: data) {
        return arr
    }
    return [TodoModel]()
//    var array = [TodoModel]()
//    for i in 0..<5 {
//        let model = TodoModel(id: i, content: "hhhh" + "\(i)", bgColor: getSixteenNum())
//        array.append(model)
//    }
//    return array
}

func updateBackLog(array: [TodoModel]) {
    UserDefaults.standard.set(try? PropertyListEncoder().encode(array), forKey:"todos")
}

func addBackLog(model: TodoModel) {
    if let data = UserDefaults.standard.value(forKey:"todos") as? Data, var arr = try? PropertyListDecoder().decode(Array<TodoModel>.self, from: data) {
        arr.insert(model, at: 0)
        UserDefaults.standard.set(try? PropertyListEncoder().encode(arr), forKey:"todos")
    } else {
        var arr = [TodoModel]()
        arr.append(model)
        UserDefaults.standard.set(try? PropertyListEncoder().encode(arr), forKey:"todos")
    }
    
}

func deleteBackLog(model: TodoModel) {
    if let data = UserDefaults.standard.value(forKey:"todos") as? Data, var arr = try? PropertyListDecoder().decode(Array<TodoModel>.self, from: data) {
        for m in arr where m.id == model.id {
            arr.removeAll{ $0 == m }
        }
        UserDefaults.standard.set(try? PropertyListEncoder().encode(arr), forKey:"todos")
    }
}
