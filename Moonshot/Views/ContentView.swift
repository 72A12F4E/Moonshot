//
//  ContentView.swift
//  Moonshot
//
//  Created by Blake McAnally on 12/16/20.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject
    var viewModel: MoonshotViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.missions) { mission in
                NavigationLink(destination: MissionView(mission: mission)) {
                    MissionLabel(mission: mission, vertical: false)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Moonshot")
            .navigationBarItems(
                trailing: Button(action: {
                    self.viewModel.isShowingLaunchDate.toggle()
                }) {
                    Text(viewModel.isShowingLaunchDate ? "Show Names" : "Show Launch Dates")
                }
            )
        }
    }
}
