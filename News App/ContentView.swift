//
//  ContentView.swift
//  News App
//
//  Created by Fathurrahman Muhammad on 01/08/22.
//  Tested on iPhone Xs Max iOS 15.5

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            ListView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
            AboutView()
                .tabItem {
                    Label("About", systemImage: "info.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
