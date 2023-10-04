//
//  HW2App.swift
//  HW2
//
//  Created by Дмитрий Цветков on 21.09.2023.
//

import SwiftUI

@main
struct HW2App: App {
    init() {
        Configurator.shared.setup()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
