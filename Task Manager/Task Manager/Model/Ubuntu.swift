//
//  Ubuntu.swift
//  Task Manager
//
//  Created by Mustafo on 05/01/23.
//

import SwiftUI

enum Ubuntu {
    case bold
    case light
    case medium
    case regular
    
    var weight: Font.Weight {
        switch self {
        case .bold: return .bold
        case .light: return .light
        case .medium: return .medium
        case .regular: return .regular
        }
    }
}


