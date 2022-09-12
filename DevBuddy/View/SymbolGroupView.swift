//
//  SymbolGroupView.swift
//  DevBuddy
//
//  Created by Breno Henrique on 17/06/22.
//

import SwiftUI

struct SymbolGroupView: View
{
    @ObservedObject var categories = SymbolViewModel()
    @State var group: SymbolGroup
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible())]
    
    var body: some View
    {
        ScrollView
        {
            LazyVGrid(columns: columns, spacing: 5)
            {
                ForEach(categories.sf)
                {
                    listedSymbol in
                    
                    NavigationLink(destination: SymbolDetailView(sf: listedSymbol))
                    {
                        ZStack
                        {
                            Rectangle()
                                .aspectRatio(1.0, contentMode: .fit)
                                .opacity(0.8)
                                .cornerRadius(15)
                                .foregroundColor(.gray)
                            
                            VStack
                            {
                                if(listedSymbol.restriction != "")
                                {
                                    HStack
                                    {
                                        Spacer()
                                        Image(systemName: "info.circle.fill")
                                            .foregroundColor(.white)
                                    }
                                    
                                    Spacer()
                                }
                                
                                else
                                {
                                    Spacer()
                                }
                                
                                Image(systemName: listedSymbol.symbol)
                                    .font(.system(size: 50))
                                    .foregroundColor(.white)
                                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                                
                                if(listedSymbol.restriction != "")
                                {
                                    Spacer()
                                }
                                
                                Spacer()
                                Text(listedSymbol.symbol.uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .lineLimit(1)
                            }
                            .padding()
                        }
                    }
                }
            }
            .onAppear(perform:
            {
                categories.getSymbolsData(groupName: group.title)
            })
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
