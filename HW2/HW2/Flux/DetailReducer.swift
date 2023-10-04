//
//  DetailReducer.swift
//  HW2
//
//  Created by Дмитрий Цветков on 04.10.2023.
//

import Foundation
import ComposableArchitecture

struct DetailReducer: Reducer {
    
    var body: Body
    
    typealias State = DetailState
    
    typealias Action = DetailAction
    
    typealias _Body = DetailEnvironment
    
    func reduce(into state: inout DetailState, action: DetailAction) -> ComposableArchitecture.Effect<DetailAction> {
        switch action {
        case .tapOnSomething:
            print("Reducer: tap on something")
            state.count += 1
            return .none
//        case .back:
//            print("Reducer: tap on back")
//            return .none
        }
    }
}
