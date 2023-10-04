//
//  ContentView.swift
//  HW2
//
//  Created by Дмитрий Цветков on 21.09.2023.
//

import SwiftUI
import ComposableArchitecture

struct MainView: View {
    @State var selectedContent: Contents = .first
    @StateObject var viewModel = MainViewModel()
    
    let stateStore: StoreOf<DetailReducer>
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .cyan
        stateStore = Store(initialState: DetailReducer.State()) {
            DetailReducer(body: DetailReducer._Body())
          }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                PickerView(selectedContent: $selectedContent)
                
                let list = MyListView(selectedContent: $selectedContent, viewModel: viewModel, stateStore: stateStore)
                
                switch selectedContent {
                case .first:
                    get(laureates: list)
                case .second:
                    get(laureates: list)
                case .third:
                    get(laureates: list)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    fileprivate func get(laureates: MyListView) -> some View {
        laureates
            .onAppear {
                viewModel.service?.clear()
                viewModel.fillMass(category: selectedContent)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
