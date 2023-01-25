//
//  View.swift
//  Task Manager
//
//  Created by Mustafo on 05/01/23.
//

import SwiftUI

extension View {
    
    func ubuntu(_ size: CGFloat,_ weight: Ubuntu)-> some View {
        self
            .font(.custom("Ubuntu", size: size))
            .fontWeight(weight.weight)
    }
    
    func hAlig(_ alignment: Alignment)-> some View {
        self
            .frame(maxWidth: .infinity,alignment: alignment)
    }
    
    func vAlig(_ alignment: Alignment)-> some View {
        self
            .frame(maxHeight: .infinity,alignment: alignment)
    }
    
}
