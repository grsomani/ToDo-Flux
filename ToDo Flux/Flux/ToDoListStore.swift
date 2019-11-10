//
//  ToDoListStore.swift
//  ToDo Flux
//
//  Created by Mac on 10/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//

struct ToDoListStore {
    
    private var toDoList = [ToDoItem]()
    
    var getToDoItems: [ToDoItem] {
        return self.toDoList
    }
    
    private init() {}
    
    init(list: [ToDoItem]) {
        self.toDoList = list
    }
}
