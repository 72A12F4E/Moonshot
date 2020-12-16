//
//  MoonshotViewModel.swift
//  Moonshot
//
//  Created by Blake McAnally on 12/16/20.
//

import Combine
import SwiftUI

class MoonshotViewModel: ObservableObject {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @Published
    var isShowingLaunchDate: Bool = true
   
    func astronauts(for mission: Mission) -> [Astronaut] {
        astronauts.filter { astronaut in
            mission.crew.contains { crewRole in
                astronaut.id == crewRole.name
            }
        }
    }
    
    func missions(for astronaut: Astronaut) -> [Mission] {
        missions.filter { mission in
            mission.crew.contains { crewRole in
                astronaut.id == crewRole.name
            }
        }
    }
    
    func crewMembers(for mission: Mission) -> [CrewMember] {
        mission.crew.compactMap { crewRole in
            CrewMember(role: crewRole.role, astronaut: astronauts.first(where: { astronaut in
                astronaut.id == crewRole.name
            })!)
        }
    }
    
    func astronauts(for roles: [CrewRole]) -> [Astronaut] {
        astronauts.filter { astronaut in
            roles.contains(where: { role in
                astronaut.id == role.name
            })
        }
    }
}
