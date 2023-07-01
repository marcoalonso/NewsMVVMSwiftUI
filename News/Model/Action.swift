//
//  Action.swift
//  News
//
//  Created by Marco Alonso Rodriguez on 30/06/23.
//

import Foundation

struct Action: Identifiable {
    let id = UUID()
    let name: String
    let action: String
    let icon: String
}

var actions: [Action] = [
Action(name: "Hacer una sugerencia", action: "sugerencia", icon: "slider.vertical.3"),
Action(name: "Califica la aplicación", action: "califica", icon: "star.leadinghalf.filled"),
Action(name: "Conocer más sobre nosotros", action: "seguir", icon: "hand.thumbsup"),
Action(name: "Desarrollador", action: "developer", icon: "person")
]
