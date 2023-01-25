//
//  Home.swift
//  Task Manager
//
//  Created by Mustafo on 05/01/23.
//

import SwiftUI

struct Home: View {
    
    @State private var currentDay = Date()
    @State private var showAddTaskView = false
    
    @EnvironmentObject var homeVM: HomeViewModel
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            timeLineView
                .padding(15)
        }
        .safeAreaInset(edge: .top) {
            headerView
        }
        .fullScreenCover(isPresented: $showAddTaskView) {
            AddTaskView()
                .environmentObject(homeVM)
        }
    }
    
    private var headerView: some View {
        VStack {
            HStack {
                VStack(alignment: .leading,spacing: 6) {
                    Text("Today")
                        .ubuntu(30, .light)
                    Text("Welcome Gus")
                        .ubuntu(14, .light)
                }
                .hAlig(.leading)
                
                Button {
                    showAddTaskView = true
                } label: {
                    HStack(spacing: 10) {
                        Image(systemName: "plus")
                        Text("Add Task")
                            .ubuntu(15, .regular)
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal,15)
                    .background {
                        Capsule()
                            .fill(Color.blue.opacity(0.8).gradient)
                    }
                    .foregroundColor(.white)
                }

            }
            
            Text(Date().toString("MMM YYYY"))
                .ubuntu(16, .medium)
                .hAlig(.leading)
                .padding(.top,15)
            
            weekRow
            
        }
        .padding(15)
        .background {
            VStack(spacing: 0) {
                Color.white
                
                Rectangle()
                    .fill(.linearGradient(colors: [.white,.clear], startPoint: .top, endPoint: .bottom))
                    .frame(height: 20)
            }
            .ignoresSafeArea()
        }
    }
    
    private var weekRow: some View {
        HStack(spacing: 0) {
            ForEach(Calendar.current.currentWeek) { weekDay in
                let status = Calendar.current.isDate(weekDay.date, inSameDayAs: currentDay)
                VStack(spacing: 6) {
                    Text(weekDay.string.prefix(3))
                        .ubuntu(12, .medium)
                    Text(weekDay.date.toString("dd"))
                        .ubuntu(16, status ? .medium : .regular)
                }
                .foregroundColor(status ? Color.blue : Color.gray)
                .hAlig(.center)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeIn(duration: 0.3)) {
                        currentDay = weekDay.date
                    }
                }
            }
        }
        .padding(.vertical,10)
        .padding(.horizontal,-15)
    }
    
    private var timeLineView: some View {
        VStack {
            ForEach(Calendar.current.hours, id: \.self) { hour in
                HourRow(hour)
            }
        }
    }
    
    
    @ViewBuilder
    private func HourRow(_ hour: Date)-> some View {
        HStack(alignment: .top) {
            Text(hour.toString("h a"))
                .ubuntu(14, .regular)
                .frame(width: 45,alignment: .leading)
            
            let filteredTasks = homeVM.tasks.filter { Calendar.current.isDate($0.dateAdded, inSameDayAs: currentDay) && (hour.toString("h a") == $0.dateAdded.toString("h a"))
                
            }
            
            if filteredTasks.isEmpty {
                Rectangle()
                    .stroke(.gray.opacity(0.5),style: StrokeStyle(lineWidth: 0.5,lineCap: .butt,lineJoin: .bevel,dash: [5],dashPhase: 5))
                    .frame(height: 0.5)
                    .offset(y: 10)
                    .transition(.scale)
            } else {
                TasksView(tasks: filteredTasks)
            }
        }
        .hAlig(.leading)
        .padding(.vertical,15)
    }
    
    private func TasksView(tasks: [Task])-> some View {
        VStack(alignment: .leading,spacing: 10) {
            ForEach(tasks) { task in
                Menu {
                    Button {
                        homeVM.deleteTask(task: task)
                    } label: {
                        Label("Delete Task", systemImage: "trash.fill")
                    }

                } label: {
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .frame(width: 2)
                            .foregroundColor(task.taskCategory.color)
                        HStack {
                            VStack(alignment: .leading) {
                                Text(task.taskName)
                                Text(task.taskDescirption)
                                    .foregroundColor(.red)
                            }
                            .ubuntu(18, .regular)
                            .hAlig(.leading)
                            
                            Text(task.taskCategory.title)
                                .ubuntu(18, .light)
                        }
                        .padding(10)
                        .background(task.taskCategory.color.opacity(0.3))
                    }
                }

                
            }
        }
        .transition(.scale)
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(HomeViewModel())
    }
}
