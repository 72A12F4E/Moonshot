//
//  AstronautView.swift
//  Moonshot
//
//  Created by Blake McAnally on 12/16/20.
//

import SwiftUI

struct AstronautView: View {
    
    let crewMember: CrewMember
    
    @EnvironmentObject
    var viewModel: MoonshotViewModel
    
    let columns: [GridItem] = [
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100)),
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.crewMember.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)

                    Text(self.crewMember.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    LazyVGrid(columns: columns) {
                        ForEach(self.viewModel.missions(for: crewMember.astronaut)) { mission in
                            MissionLabel(mission: mission, vertical: true)
                        }
                    }
                }
            }
        }
        .navigationBarTitle(Text(crewMember.astronaut.name), displayMode: .inline)
    }
}
