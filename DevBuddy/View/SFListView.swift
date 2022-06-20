//
//  SFListView.swift
//  DevBuddy
//
//  Created by Breno Henrique on 17/06/22.
//

import SwiftUI

struct SFListView: View
{
    @ObservedObject var categories = SymbolViewModel()
    
    var body: some View
    {
        NavigationView
        {
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
            .navigationTitle("SF Symbols")
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
        SFListView()
    }
}
