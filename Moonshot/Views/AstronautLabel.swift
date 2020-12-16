//
//  AstronautLabel.swift
//  Moonshot
//
//  Created by Blake McAnally on 12/16/20.
//

import SwiftUI

struct AstronautLabel: View {
    
    @EnvironmentObject
    var viewModel: MoonshotViewModel
    
    let crewMember: CrewMember
    
    var body: some View {
        HStack {
            Image(crewMember.astronaut.id)
                .resizable()
                .frame(width: 83, height: 60)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.primary, lineWidth: 1))

            VStack(alignment: .leading) {
                Text(crewMember.astronaut.name)
                    .font(.headline)
                Text(crewMember.role)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding(.horizontal)
    }
}
