//
//  ExpandingBoxBackground.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/19/26.
//

import SwiftUI

extension View {
    func stackExpandingBoxBackgrounded(cornerRadius: CGFloat = 8, alignment: Alignment = .center) -> some View {
        ZStack(alignment: alignment) {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(.black.mix(with: .white, by: 0.15))
                .strokeBorder(.black.mix(with: .white, by: 0.2))
            self
                .inExpandingRectangle()
        }
        
            
    }
}
