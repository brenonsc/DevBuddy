//
//  SymbolGroupView.swift
//  DevBuddy
//
//  Created by Breno Henrique on 17/06/22.
//

import SwiftUI

struct SymbolGroupView: View
{
    var group: SymbolGroup
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible())]
    
    var body: some View
    {
        ScrollView
        {
            LazyVGrid(columns: columns, spacing: 5)
            {
                //NavigationLink
            }
            .padding()
        }
        .navigationTitle("\(group.title)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SymbolGroupView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SymbolGroupView(group: SymbolGroup(id: "x", symbol: "x", title: "x"))
    }
}
