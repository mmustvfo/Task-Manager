//
//  Category.swift
//  Task Manager
//
//  Created by Mustafo on 05/01/23.
//

import SwiftUI

enum Category: Int,CaseIterable {
    case general, bug, idea ,challenge, modifiers, coding
    
    var color: Color {
        switch self {
        case .general: return .red.opacity(0.8)
        case .bug: return .green
        case .challenge: return .purple
        case .modifiers: return .blue
        case .idea: return .pink
        case .coding: return .brown
        }
    }
    
    var title: String {
        switch self {
        case .general: return "General"
        case .bug: return "Bug"
        case .idea: return "Idea"
        case .challenge: return "Challenge"
        case .modifiers: return "Modifiers"
        case .coding: return "Coding"
        }
    }
    
    var index: Int {
        return self.rawValue
    }
    
}


