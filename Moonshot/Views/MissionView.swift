//
//  MissionView.swift
//  Moonshot
//
//  Created by Blake McAnally on 12/16/20.
//

import SwiftUI

struct MissionView: View {
    
    let mission: Mission
    
    @EnvironmentObject
    var viewModel: MoonshotViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.7)
                        .padding(.top)
                    //Challenge 1
                    Text(self.mission.formattedLaunchDate)
                        .padding()
                    
                    Text(self.mission.description)
                        .padding()

                    ForEach(self.viewModel.crewMembers(for: self.mission)) { crewMember in
                        NavigationLink(destination: AstronautView(crewMember: crewMember)) {
                            AstronautLabel(crewMember: crewMember)
                        }.buttonStyle(PlainButtonStyle())
                    }
                    Spacer(minLength: 25)
                }
            }
        }
        .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
    }
}
