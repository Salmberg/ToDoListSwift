//
//  RealmManager.swift
//  ToDoList
//
//  Created by David Salmberg on 2023-04-14.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm : Realm?
    @Published private(set) var tasks: [Task] = []
    
    init() {
        openRealm()
        getTask()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
           localRealm = try Realm()
            
        }catch{
            print("Error opening realm: \(error)")
        }
    }
    
    func addTask(taskTitle: String) {
        if let localRealm = localRealm {
            do{
                try localRealm.write {
                    let newTask = Task(value: ["title": taskTitle, "completed": false])
                    localRealm.add(newTask)
                    getTask()
                    print("Added new task to realm \(newTask)")
                }
            }catch{
                print("Error adding task to Realm \(error)")
            }
        }
    }
    func getTask() {
        if let localRealm = localRealm {
           let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            allTasks.forEach { task in
                tasks.append(task)
                
                
            }
        }
    }
    func updateTask(id: ObjectId, completed : Bool) {
        if let localRealm = localRealm {
            do{
             let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToUpdate.isEmpty else {return}
                
                try localRealm.write {
                    taskToUpdate[0].completed = completed
                    getTask()
                    print("Updated task with id: \(id)! Completed status: \(completed)")

                }
                
            } catch {
                print("Error updating task\(id) to Realm: \(error)")
            }
        }
    }
    
    func deleteTask(id: ObjectId) {
        
    }
    
}