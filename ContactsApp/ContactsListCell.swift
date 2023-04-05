//
//  ContactsListCell.swift
//  ContactsApp
//
//  Created by Maciej Michalik on 05/04/2023.
//

import SwiftUI

struct ContactsListCell: View {
    
    let contacts: Contacts
    
    var body: some View {
        HStack{
            Text(contacts.name)
            VStack{
                Image(contacts.picture)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
            
        }
    }
}

struct ContactsListCell_Previews: PreviewProvider {
    static var previews: some View {
        ContactsListCell(contacts: MockData.sampleContact)
    }
}
