//
//  WorkoutsView.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/6/26.
//

import SwiftUI
import Messages

struct WorkoutsView: View {
    @ObservedObject var vm = WorkoutStackViewModel.shared
    
    var body: some View {
        switch vm.page {
        case .home:
            HomeView()
        case .create:
            CreateWorkoutView()
        case .detail(let message):
            Text("Deatil viea")
        case .profile:
            ProfileView()
        }
    }
}

enum Page {
    case home
    case create
    case detail(message: MSMessage)
    case profile
}


