//
//  Task_ManagerTests.swift
//  Task ManagerTests
//
//  Created by Mustafo on 25/01/23.
//

import XCTest
@testable import Task_Manager

// Namin Structure: test_UnitOfWork_StateUnderTest_ExpectedBehaviour

// Testing Structure: Given, When, Then

final class Task_ManagerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_HomeViewModel_tasks_shouldBeAdded() {
        // Given
        let homeVM = HomeViewModel()
        let task = Task(dateAdded: Date(), taskName: "Make New Video", taskDescirption: "Video About Andrew Tate", taskCategory: .idea)
        
        
        // When
        homeVM.addTask(task: task)
        
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { //Adding this little time since task can take a bit of time to be added
            XCTAssertFalse(homeVM.tasks.isEmpty)
        }
    }


}
