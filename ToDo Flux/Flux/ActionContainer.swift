//
//  ActionContainer.swift
//  ToDo Flux
//
//  Created by Mac on 10/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

enum ActionContainer {
    case add(ToDoItem)
    case delete(ToDoItem)
    case complete(ToDoItem)
    case clearAll
}
