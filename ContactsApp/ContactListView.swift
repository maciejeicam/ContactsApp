//
//  ContactListView.swift
//  ContactsApp
//
//  Created by Maciej Michalik on 05/04/2023.
//

import SwiftUI

struct ContactListView: View {
    
    @State private var contacts: [Contacts] = []
    
    var body: some View {
        NavigationView {
            List(contacts) { contact in
                ContactsListCell(contacts: contact)
            }
            .navigationTitle("✆ Contact List")
        }
        .onAppear {
            getContacts()
        }
    }
    
    func getContacts() {
        NetworkManager.shared.getContacts { result in
            DispatchQueue.main.async {
                switch result {
                case.success(let contacts):
                    self.contacts = contacts
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView()
    }
}
