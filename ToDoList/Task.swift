//
//  Task.swift
//  ToDoList
//
//  Created by David Salmberg on 2023-04-14.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
