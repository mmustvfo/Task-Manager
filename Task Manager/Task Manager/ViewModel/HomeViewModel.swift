//
//  HomeViewModel.swift
//  Task Manager
//
//  Created by Mustafo on 05/01/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var tasks: [Task] = []
    
    private var cancellables = Set<AnyCancellable>()
    private let taskPercistenceManager = TasksPersistenceManager()
    
    init() {
        addCancellables()
    }
    
    
    func addTask(task: Task) {
        taskPercistenceManager.addTask(task: task)
    }
    
    func deleteTask(task: Task) {
        taskPercistenceManager.deleteTask(task: task)
    }
    
    private func addCancellables() {
        taskPercistenceManager.$tasks
            .sink() { taskEntities in
                DispatchQueue.main.async {
                    self.tasks = taskEntities.map { $0.task }
                }
            }
            .store(in: &cancellables)
    }
    
    
}
