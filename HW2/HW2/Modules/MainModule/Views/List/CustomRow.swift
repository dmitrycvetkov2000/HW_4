//
//  CustomRow.swift
//  HW2
//
//  Created by Дмитрий Цветков on 22.09.2023.
//

import SwiftUI
import ComposableArchitecture

struct CustomRow: View, Identifiable {
    var id = UUID()
    
    var text: String
    let isloading: Bool
    
    let stateStore: StoreOf<DetailReducer>
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.mint)
            VStack {
                NavigationPushButton(destination: SecondView(str: text, stateStore: stateStore)) {
                    Text(text)
                }
            }

        }
    }
}

//struct CustomRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomRow(text: "", isloading: false)
//    }
//}
