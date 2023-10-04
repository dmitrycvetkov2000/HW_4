//
//  SecondView.swift
//  HW2
//
//  Created by Дмитрий Цветков on 21.09.2023.
//

import SwiftUI
import ComposableArchitecture
import UILib

struct SecondView: View {
    @EnvironmentObject var navigation: NavigationStackViewModel
    
    var str: String
    
    let stateStore: StoreOf<DetailReducer>
    
    var body: some View {
        WithViewStore(self.stateStore, observe: { $0 }) { viewStore in
            VStack {
                TextLib(text: "Second screen \(str), count: \(viewStore.state.count)")
                    .background(Color.green)
                NavigationPushButton(destination: ThirdView()) {
                    Text("Подробнее")
                }.onTapGesture {
                    viewStore.send(.tapOnSomething)
                    navigation.push(screen: ThirdView())
                }
                NavigationPopButton(destination: .root) {
                    Text("Назад")
                }
            }
        }
    }
}

//struct SecondView_Previews: PreviewProvider {
//    static var previews: some View {
//        SecondView(str: "")
//    }
//}
