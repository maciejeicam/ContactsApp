//
//  ContentView.swift
//  ContactsApp
//
//  Created by Maciej Michalik on 05/04/2023.
//

import SwiftUI

struct ContactsTabView: View {
    var body: some View {
        TabView{
            ContactListView()
                .tabItem {
                    Image(systemName: "phone")
                    Text("Contacts")
                }
            FavouritesContactsListView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favourites")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsTabView()
    }
}
