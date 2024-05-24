//
//  CounterUsingTCATests.swift
//  CounterUsingTCATests
//
//  Created by Arun Rathore on 17/05/24.
//

import XCTest
import ComposableArchitecture

@testable import CounterUsingTCA

@MainActor
final class CounterUsingTCATests: XCTestCase {
    let store = TestStore(initialState: CounterFeature.State()) {
      CounterFeature()
    }

    let appFeatureStore = TestStore(initialState: AppFeature.State()) {
          AppFeature()
        }

    func testCounter() async {
        await store.send(.incrementButtonTapped) {
          $0.count = 1
        }
        await store.send(.decrementButtonTapped) {
          $0.count = 0
        }
     }

    func testTimer() async {
        await store.send(.toggleTimerButtonTapped) {
             $0.isTimerRunning = true
           }
           await store.receive(\.timerTick, timeout: .seconds(2)) {
             $0.count = 1
           }
           await store.send(.toggleTimerButtonTapped) {
             $0.isTimerRunning = false
           }

    }

    func testNumberFact() async {
        let store = TestStore(initialState: CounterFeature.State()) {
          CounterFeature()
        } withDependencies: {
          $0.numberFact.fetch = { "\($0) is a good number." }
        }

        await store.send(.factButtonTapped) {
          $0.isLoading = true
        }
        await store.receive(\.factResponse) {
          $0.isLoading = false
          $0.fact = "0 is a good number."
        }
      }

    func testIncrementInFirstTab() async {
        await appFeatureStore.send(\.tab1.incrementButtonTapped) {
          $0.tab1.count = 1
        }
    }

}
