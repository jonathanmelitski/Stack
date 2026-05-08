//
//  CreateWorkoutView.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/7/26.
//

import SwiftUI
import Messages

struct CreateWorkoutView: View {
    @ObservedObject var vm = WorkoutStackViewModel.shared
    
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
                        WorkoutStackViewModel.shared.dismiss()
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
            }
            Spacer()
        }
        .padding([.horizontal, .bottom])
        .foregroundStyle(.white)
    }
}
