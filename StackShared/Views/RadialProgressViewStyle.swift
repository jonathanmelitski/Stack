//
//  RadialProgressViewStyle.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/12/26.
//

import SwiftUI

struct RadialProgressViewStyle: ProgressViewStyle {
    let completedByUser: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .stroke(Color.black.mix(with: .white, by: 0.2), lineWidth: 4)
            Circle()
                .trim(from: 0, to: configuration.fractionCompleted ?? 0)
                .stroke(Color.accent, style: StrokeStyle(lineWidth: 4, lineCap: .round))
                .rotationEffect(.degrees(-90))
        }
    }
}
