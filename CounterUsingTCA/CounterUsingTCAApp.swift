//
//  CounterUsingTCAApp.swift
//  CounterUsingTCA
//
//  Created by Arun Rathore on 17/05/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct CounterUsingTCAApp: App {
    static let store = Store(initialState: AppFeature.State()) {
        AppFeature()
      }
    var body: some Scene {
        WindowGroup {
            AppView(store: CounterUsingTCAApp.store)
        }
    }
}
