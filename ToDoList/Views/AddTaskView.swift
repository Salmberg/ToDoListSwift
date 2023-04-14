//
//  AddTaskView.swift
//  ToDoList
//
//  Created by David Salmberg on 2023-04-14.
//

import SwiftUI

struct AddTaskView: View {
    @State private var title: String = ""
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Create a new task")
                .font(.title3).bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Enter task here",text: $title )
                .textFieldStyle(.roundedBorder)
            
            Button {
                print("Task added!")
                dismiss()
            } label: {
                Text("Add task")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .padding(.horizontal)
                    .background(.gray)
                    .cornerRadius(20)
            }
            Spacer()
                            
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Color(.black))
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}
