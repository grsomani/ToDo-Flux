//
//  ToDoItem.swift
//  ToDo Flux
//
//  Created by Mac on 10/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

enum ToDoState {
    case toDo
    case completed
}

struct ToDoItem {
    var name: String
    var state: ToDoState = .toDo
}
