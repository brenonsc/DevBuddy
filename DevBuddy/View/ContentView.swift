//
//  SFListView.swift
//  DevBuddy
//
//  Created by Breno Henrique on 17/06/22.
//

import SwiftUI

struct ContentView: View
{
    @ObservedObject var categories = SymbolViewModel()
    @State var selectedTab: Tabs = .tab1
    
    var body: some View
    {
        NavigationView
        {
            TabView(selection: $selectedTab)
            {
                //SF Symbols
                List(categories.groups)
                {
                    listedGroup in
                    
                    NavigationLink(destination: SymbolGroupView(group: listedGroup))
                    {
                        HStack (spacing: 20)
                        {
                            Image(systemName: listedGroup.symbol)
                            
                            Text(listedGroup.title)
                        }
                    }
                }
                .tabItem
                {
                    Label("SF Symbols", systemImage: "staroflife.fill")
                }
                .tag(Tabs.tab1)
                
                
                //Gradients
                VStack(spacing: 30)
                {
                    Spacer()
                    
                    Image(systemName: "exclamationmark.triangle")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .padding(.horizontal, 100)
                    
                    Text("Under Development".uppercased())
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
                .tabItem
                {
                    Label("Gradients", systemImage: "eyedropper.halffull")
                }
                .tag(Tabs.tab2)
                
                
                //About
                VStack(spacing: 30)
                {
                    Spacer()
                    
                    Image(systemName: "exclamationmark.triangle")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .padding(.horizontal, 100)
                    
                    Text("Under Development".uppercased())
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
                .tabItem
                {
                    Label("About", systemImage: "info")
                }
                .tag(Tabs.tab3)
            }
            .navigationBarTitle(returnNaviBarTitle(selectedTab: self.selectedTab))
        }
    }
    
    enum Tabs
    {
        case tab1, tab2, tab3
    }
    
    func returnNaviBarTitle(selectedTab: Tabs) -> String
    {
        switch selectedTab
        {
            case .tab1: return "SF Symbols"
            case .tab2: return "Gradients"
            case .tab3: return "About"
        }
    }
    
    init()
    {
        categories.getGroupData()
    }
}

struct SFListView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
