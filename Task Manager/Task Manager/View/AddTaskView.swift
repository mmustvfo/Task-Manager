//
//  AddTaskView.swift
//  Task Manager
//
//  Created by Mustafo on 05/01/23.
//

import SwiftUI
import WebKit

struct AddTaskView: View {
    
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var homeVM: HomeViewModel
    
    @State private var taskName = ""
    @State private var taskDescription = ""
    @State private var taskCategory = Category.general
    @State private var taskDate = Date()
    
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading,spacing: 10) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .contentShape(Rectangle())
                }
                
                Text("Create New Task")
                    .ubuntu(28, .light)
                    .foregroundColor(.white)
                    .padding(.vertical,15)
                
                TitleView("NAME")
                
                TextField("Make New Video", text: $taskName)
                    .ubuntu(16, .regular)
                    .tint(.white)
                    .padding(.top,2)

                Rectangle()
                    .fill(.white.opacity(0.7))
                    .frame(height: 1)
                
                TitleView("DATE")
                    .padding(.top,15)
                
                HStack(alignment: .bottom,spacing: 12) {
                    HStack(spacing: 12) {
                        Text(taskDate.toString("EEEE dd, MMMM"))
                            .ubuntu(16, .regular)
                        Image(systemName: "calendar")
                            .font(.title3)
                            .foregroundColor(.white)
                            .overlay {
                                DatePicker("", selection: $taskDate)
                                    .blendMode(.destinationOver)
                            }
                    }
                    .offset(y: -5)
                    .overlay(alignment: .bottom) {
                        Rectangle()
                            .foregroundColor(.white.opacity(0.7))
                            .frame(height: 1)
                            .offset(y: 5)
                    }
                    
                    HStack(spacing: 12) {
                        Text(taskDate.toString("hh:mm a"))
                            .ubuntu(16, .regular)
                        Image(systemName: "clock")
                            .font(.title3)
                            .foregroundColor(.white)
                            .overlay {
                                DatePicker("", selection: $taskDate)
                                    .blendMode(.destinationOver)
                            }
                    }
                    .offset(y: -5)
                    .overlay(alignment: .bottom) {
                        Rectangle()
                            .foregroundColor(.white.opacity(0.7))
                            .frame(height: 1)
                            .offset(y: 5)
                    }
                }
                .padding(.bottom,15)
                
                
            }
            .environment(\.colorScheme, .dark)
            .hAlig(.leading)
            .padding(15)
            .background {
                taskCategory.color
                    .ignoresSafeArea()
            }
            
            VStack(alignment: .leading) {
                Text("DESCRIPTION")
                    .ubuntu(12, .regular)
                    .foregroundColor(.gray)
                VStack {
                    TextField("About Task", text: $taskDescription)
                        .foregroundColor(.black)
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.gray)
                }
                
            }
            .padding(.horizontal,25)
            .padding(.top,10)
            
            
            
            VStack(alignment: .leading,spacing: 10) {
                Text("CATEGORY")
                    .foregroundColor(.gray)
                    .ubuntu(12, .regular)
                    .padding(.leading,25)
                
                LazyVGrid(
                    columns: Array<GridItem>.init(
                        repeating:
                            GridItem(.fixed(UIScreen.main.bounds.width / 4),
                                     spacing: 25),count: 3)) {
                    ForEach(Category.allCases,id: \.self) { category in
                        Text(category.title)
                            .ubuntu(15, .bold)
                            .foregroundColor(taskCategory == category ? .white : category.color)
                            .frame(width: UIScreen.main.bounds.width / 4)
                            .padding(.vertical,8)
                            .background(category.color.opacity(0.5))
                            .cornerRadius(8)
                            .padding(.vertical,10)
                            .onTapGesture {
                                withAnimation {
                                    taskCategory = category
                                }
                            }
                    }
                }
            }
            .padding(.top)
            
            Button {
                let task = Task(dateAdded: taskDate, taskName: taskName, taskDescirption: taskDescription, taskCategory: taskCategory)
                homeVM.addTask(task: task)
                dismiss()
            } label: {
                Text("Create Task")
                    .ubuntu(18, .regular)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,10)
                    .background {
                        Capsule()
                            .fill(Color.blue.opacity(0.8).gradient)
                    }
                    .foregroundColor(.white)
            }
            .padding(.horizontal,25)
            .vAlig(.bottom)

        }
        .vAlig(.top)
    }
    
    func TitleView(_ value: String)-> some View {
        Text(value)
            .ubuntu(12, .regular)
            .foregroundColor(.white.opacity(0.7))
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(HomeViewModel())
    }
}
