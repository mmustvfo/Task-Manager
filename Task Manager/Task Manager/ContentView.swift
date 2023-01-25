//
//  ContentView.swift
//  Task Manager
//
//  Created by Mustafo on 05/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .environmentObject(HomeViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
