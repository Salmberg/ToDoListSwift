//
//  TasksView.swift
//  ToDoList
//
//  Created by David Salmberg on 2023-04-14.
//

import SwiftUI

struct TasksView: View {
    @EnvironmentObject var realmManager : RealmManager
    
    var body: some View {
        VStack{
            Text("My tasks")
                .font(.title3.bold())
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            List {
                ForEach(realmManager.tasks, id: \.id) {
                    task in
                                  // Must wrap in an if statement because we don't want to display the task if it has been invalidated (will run into a crash otherwise)
                                  if !task.isInvalidated {
                                      TaskRow(task: task.title, completed: task.completed)
                                          .onTapGesture {
                                              realmManager.updateTask(id: task.id, completed: !task.completed)
                                          }
                                          .swipeActions(edge: .trailing) {
                                              Button(role: .destructive) {
                                                  
                                                  realmManager.deleteTask(id: task.id)
                                              } label: {
                                                  Label("Delete", systemImage: "trash")
                                              }
                                          }
                                  }
                              }
                .listRowSeparator(.hidden)
                
            }
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance()
                    .backgroundColor = UIColor.clear
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}
