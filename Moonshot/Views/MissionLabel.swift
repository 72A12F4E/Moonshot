//
//  MissionLabel.swift
//  Moonshot
//
//  Created by Blake McAnally on 12/16/20.
//

import SwiftUI

struct MissionLabel: View {
    
    let mission: Mission
    
    let vertical: Bool
    
    @EnvironmentObject
    var viewModel: MoonshotViewModel
    
    var body: some View {
        if vertical {
            VStack {
                Image(self.mission.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 44, height: 44)

                VStack(alignment: .center) {
                    Text(self.mission.displayName)
                        .font(.headline)
                    if viewModel.isShowingLaunchDate {
                        Text(self.mission.formattedLaunchDate)
                    } else {
                        VStack {
                            ForEach(self.viewModel.astronauts(for: mission.crew)) { astronaut in
                                Text(astronaut.name)
                            }
                        }
                    }
                }
            }
        } else {
            HStack {
                Image(self.mission.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 44, height: 44)

                VStack(alignment: .leading) {
                    Text(self.mission.displayName)
                        .font(.headline)
                    if viewModel.isShowingLaunchDate {
                        Text(self.mission.formattedLaunchDate)
                    } else {
                        VStack(alignment: .leading) {
                            ForEach(self.viewModel.astronauts(for: mission.crew)) { astronaut in
                                Text(astronaut.name)
                            }
                        }
                    }
                }
            }
        }
    }
}
