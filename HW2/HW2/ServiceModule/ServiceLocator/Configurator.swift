//
//  Configurator.swift
//  HW2
//
//  Created by Дмитрий Цветков on 30.09.2023.
//

import Foundation

class Configurator {
    static let shared = Configurator()
    
    private init() {}
    
    func setup() {
        setupLaureateService()
    }
    
    private func setupLaureateService() {
        let laureateService: LaureteServiceProtocol = LaureteService()
        ServiceLocator.addService(laureateService)
    }
}
