//
//  AddContactFeatureView.swift
//  CounterUsingTCA
//
//  Created by Arun Rathore on 19/05/24.
//

import SwiftUI
import ComposableArchitecture


struct AddContactView: View {
    @Bindable var store: StoreOf<AddContactFeature>


  var body: some View {
    Form {
      TextField("Name", text: $store.contact.name.sending(\.setName))
      Button("Save") {
        store.send(.saveButtonTapped)
      }
    }
    .toolbar {
      ToolbarItem {
        Button("Cancel") {
          store.send(.cancelButtonTapped)
        }
      }
    }
  }
}


#Preview {
    if #available(iOS 16.0, *) {
        NavigationStack {
            AddContactView(
                store: Store(
                    initialState: AddContactFeature.State(
                        contact: Contact(
                            id: UUID(),
                            name: "Blob"
                        )
                    )
                ) {
                    AddContactFeature()
                }
            )
        }
    } else {
        // Fallback on earlier versions
    }
}
