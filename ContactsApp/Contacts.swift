//
//  Contacts.swift
//  ContactsApp
//
//  Created by Maciej Michalik on 05/04/2023.
//

import Foundation

struct Contacts: Identifiable, Decodable {
    var id = UUID()
    let name: String
    let location: String
    let email: String
    let phone: Int
    let cell: Int
    let picture: String
}

struct ContactsRespose: Decodable {
    let request: [Contacts]
}

struct MockData {
    static let sampleContact = Contacts(name: "Maciej Michalik", location: "krakow", email: "macijeainoda@2nid.qod", phone: 1231-213-123, cell: 232223232, picture: "Image")
    
    
    static let contacts = [sampleContact, sampleContact,sampleContact,sampleContact,sampleContact,sampleContact]
}
