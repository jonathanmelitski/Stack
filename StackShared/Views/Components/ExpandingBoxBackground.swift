//
//  ExpandingBoxBackground.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/19/26.
//

import SwiftUI

public extension View {
    func stackBoxBackgrounded(cornerRadius: CGFloat = 8) -> some View {
        self
            .background {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(.black.mix(with: .white, by: 0.15))
                    .strokeBorder(.black.mix(with: .white, by: 0.2))
            }
    }
}
