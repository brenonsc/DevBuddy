//
//  SymbolRectangleView.swift
//  DevBuddy
//
//  Created by Breno Henrique on 23/06/22.
//

import SwiftUI

struct SymbolRectangleView: View
{
    @State private var isAnimatingImage: Bool = false
    var sf: SymbolData
    
    var body: some View
    {
        ZStack {
            GeometryReader { (geometry : GeometryProxy) in
                VStack(spacing: 0){
                    
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.red)
                        .frame(width: geometry.size.width * 0.92, height: geometry.size.height/4)
                    
                    HStack(spacing: 0)
                    {
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: geometry.size.width/2, height: geometry.size.height/4,alignment: .center)
                        Rectangle()
                            .fill(Color.green)
                            .frame(width: geometry.size.width/2, height: geometry.size.height/4,alignment: .center)
                    }
                    HStack(spacing: 0)
                    {
                        Rectangle()
                            .fill(Color.green)
                            .frame(width: geometry.size.width/2, height: geometry.size.height/4,alignment: .center)
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: geometry.size.width/2, height: geometry.size.height/4,alignment: .center)
                    }
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: geometry.size.width, height: geometry.size.height/4)
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            }
        }
        /*
        ZStack
        {
            GeometryReader
            {
                geo in
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(.gray)
                    .scaledToFit()
                    .frame(width: geo.size.width * 1, height: geo.size.width * 0.92)
            }
            
            GeometryReader
            {
                geo in
                
                Image(systemName: sf.symbol)
                    .resizable()
                    .foregroundColor(.white)
                    .scaledToFit()
                    .frame(width: geo.size.width * 0.7, height: geo.size.width * 0.7)
                    .frame(width: geo.size.width, height: geo.size.height * 0.92)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    .scaleEffect(isAnimatingImage ? 1.0 : 0.6)
            }
        }
        .onAppear()
        {
            withAnimation(.easeOut(duration: 0.5))
            {
                isAnimatingImage = true
            }
        }
         */
    }
}

struct SymbolRectangleView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SymbolRectangleView(sf: SymbolData(id: "x", symbol: "keyboard"))
    }
}
