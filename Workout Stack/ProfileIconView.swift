//
//  ProfileIconView.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/7/26.
//

import SwiftUI

struct ProfileIconView: View {
    let profile: Profile
    
    var body: some View {
        Circle()
            .fill(profile.color)
            .overlay {
                Group {
                    if let char = profile.overlayCharacter {
                        Text(char)
                    } else {
                        Image(systemName: "person.fill")
                    }
                }
                .font(.custom("SF Pro", size: 24))
            }
            .foregroundStyle(.white)
            .bold()
            .aspectRatio(1.0, contentMode: .fit)
    }
}
