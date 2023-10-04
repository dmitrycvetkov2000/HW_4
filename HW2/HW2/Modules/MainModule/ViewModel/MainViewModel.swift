//
//  MainViewModel.swift
//  HW2
//
//  Created by Дмитрий Цветков on 22.09.2023.
//

import SwiftUI
import NewsApiNetworking

class MainViewModel: ObservableObject {
    @Published var laureates: [LaureateDataSource] = []
    @Published var inProgress: Bool = false
    @Published var isFinished: Bool = false
    
    @Injected var service: LaureteServiceProtocol?
    
    func fillMass(category: Contents) {
        guard inProgress == false else { return }
        self.laureates.removeAll()
        
        getLaureates(category: category)
    }
    
    func getLaureates(category: Contents) {
        self.inProgress = true
        getLaureatesFromService(category: category)
    }
    
    private func getLaureatesFromService(category: Contents) {
        let category = convertCategories(category: category)
        service?.getLaureates(category: category, completion: { data in
            self.laureates = data
            self.inProgress = false
            self.isFinished = self.service?.isFinished ?? true
        })
    }
    
    fileprivate func convertCategories(category: Contents) -> DefaultAPI.NobelPrizeCategory_laureatesGet {
        switch category {
        case .first: return .che
        case .second: return .med
        case .third: return .eco
        }
    }
}

