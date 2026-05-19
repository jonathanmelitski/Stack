//
//  CreateWorkoutView.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/7/26.
//

import SwiftUI
import Messages
import StackShared

struct CreateWorkoutView: View {
    @EnvironmentObject var vm: WorkoutStackViewModel
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button {
                        self.vm.requestStyle(vm.userPreferredStyle)
                        withAnimation(.snappy(duration: 0.2)) {
                            self.vm.page = .home
                        }
                    } label: {
                        HStack(spacing: 2) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                    }
                    .foregroundStyle(.accent)
                    Spacer()
                    Button {
                        vm.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .buttonStyle(.plain)
                    
                }
                HStack {
                    Spacer()
                    Text("NEW WORKOUT")
                        .font(.custom("Anton-Regular", fixedSize: 20))
                        .bold()
                    Spacer()
                }
                Button("stage trial workout") {
                    Task {
                        try? await self.vm.sendNewWorkoutMessage(workout: StackWorkout.sample)
                    }
                }
                
            }
            Spacer()
        }
        .padding([.horizontal, .bottom])
        .foregroundStyle(.white)
    }
}
