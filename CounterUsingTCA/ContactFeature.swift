//
//  ContactFeature.swift
//  CounterUsingTCA
//
//  Created by Arun Rathore on 19/05/24.
//

import Foundation
import ComposableArchitecture
import SwiftUI

struct Contact: Equatable, Identifiable {
    let id: UUID
    var name: String
}

@Reducer
struct ContactsFeature {
    @ObservableState
    struct State: Equatable {
        @Presents var addContact: AddContactFeature.State?
        var contacts: IdentifiedArrayOf<Contact> = []
    }

    enum Action {
        case addButtonTapped
        case addContact(PresentationAction<AddContactFeature.Action>)
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                case .addButtonTapped:
                    state.addContact = AddContactFeature.State(
                        contact: Contact(id: UUID(), name: "")
                    )
                    return .none
//                case .addContact(.presented(.cancelButtonTapped)):
//                    state.addContact = nil
//                    return .none

                case let .addContact(.presented(.delegate(.saveContact(contact)))):
//                    guard let contact = state.addContact?.contact
//                          else { return .none }
                    state.contacts.append(contact)
//                    state.addContact = nil
                    return .none

                case .addContact:
                        return .none
            }

        }
        .ifLet(\.$addContact, action: \.addContact) {
            AddContactFeature()
        }
    }
}


