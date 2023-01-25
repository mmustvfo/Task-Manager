//
//  Date.swift
//  Task Manager
//
//  Created by Mustafo on 05/01/23.
//

import Foundation

extension Date {
    
    func toString(_ format: String)-> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    
}
