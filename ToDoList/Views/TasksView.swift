//
//  TasksView.swift
//  ToDoList
//
//  Created by David Salmberg on 2023-04-14.
//

import SwiftUI

struct TasksView: View {
    var body: some View {
        VStack{
            Text("My tasks")
                .font(.title3.bold())
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
