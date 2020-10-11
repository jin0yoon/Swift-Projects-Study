//
//  ContentView.swift
//  recipeat
//
//  Created by 윤진영 on 2020/10/11.
//

import SwiftUI

struct TabbedRootView: View {
    
    @State private var selection = 0
    
    var body: some View {
        
        TabView(selection: $selection){
            Text("First View")
                .font(.title)
                .tabItem {
                    VStack{
                        Image(systemName: "house")
                        Text("Home")
                    }
                }.tag(0)
            
            Text("Second View")
                .font(.title)
                .tabItem {
                    VStack{
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }.tag(1)
            
            Text("Third View")
                .font(.title)
                .tabItem {
                    VStack{
                        Image(systemName: "person.circle")
                        Text("Me")
                    }
                }.tag(2)
        }
    }
}

struct TabbedRootView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedRootView()
    }
}
