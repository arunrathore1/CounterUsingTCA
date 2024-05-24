//
//  AppView.swift
//  CounterUsingTCA
//
//  Created by Arun Rathore on 18/05/24.
//

import ComposableArchitecture
import SwiftUI


struct AppView: View {
  // let store1: StoreOf<CounterFeature>
  // let store2: StoreOf<CounterFeature>
  let store: StoreOf<AppFeature>

  var body: some View {
    TabView {
        CounterView(store: store.scope(state: \.tab1, action: \.tab1))
        .tabItem {
          Text("Counter 1")
        }

        CounterView(store: store.scope(state: \.tab2, action: \.tab2))
        .tabItem {
          Text("Counter 2")
        }
    }
  }
}


#Preview {
  AppView(
    store: Store(initialState: AppFeature.State()) {
      AppFeature()
    }
  )
}
