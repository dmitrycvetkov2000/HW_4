//
//  LaureateService.swift
//  HW2
//
//  Created by Дмитрий Цветков on 30.09.2023.
//

import SwiftUI
import NewsApiNetworking

protocol LaureteServiceProtocol {
    var inProgress: Bool { get set }
    var isFinished: Bool { get set }

    func clear()
    func getLaureates(category: DefaultAPI.NobelPrizeCategory_laureatesGet, completion: @escaping ([LaureateDataSource]) -> Void)
}

final class LaureteService: LaureteServiceProtocol {
    var inProgress: Bool = false
    var isFinished: Bool = false
    var laureates: [LaureateDataSource] = []

    fileprivate let limit = 25

    func getLaureates(category: DefaultAPI.NobelPrizeCategory_laureatesGet,
                      completion: @escaping ([LaureateDataSource]) -> Void) {
        self.inProgress = true
        fetchLaureates(category: category) { data in
            completion(data)
        }
    }

    fileprivate func fetchLaureates(category: DefaultAPI.NobelPrizeCategory_laureatesGet,
                                    completion: @escaping ([LaureateDataSource]) -> Void) {
        DefaultAPI.laureatesGet(offset: laureates.count, limit: limit, nobelPrizeCategory: category) { [weak self] data, error in
            guard let self = self, let data = data, let laureates = data.laureates else { return }
            laureates.forEach {
                self.laureates.append(.init(laureate: $0))
                completion(self.laureates)
            }
            self.inProgress = false
            self.isFinished = data.links?.next == nil
        }
    }

    func clear() {
        clearLaureates()
    }

    fileprivate func clearLaureates() {
        laureates.removeAll()
    }
}

