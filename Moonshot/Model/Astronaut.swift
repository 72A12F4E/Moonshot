//
//  Astronaut.swift
//  Moonshot
//
//  Created by Blake McAnally on 12/16/20.
//

import Foundation

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

extension CrewMember: Identifiable {
    var id: String {
        astronaut.id
    }
}
