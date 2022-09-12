//
//  SymbolPickerView.swift
//  DevBuddy
//
//  Created by Breno Henrique on 02/07/22.
//

import SwiftUI

struct SymbolPickerView: View
{
    var clr: ColorData
    var rendering: RenderingMode
    
    var body: some View
    {
        GroupBox
        {
            VStack(alignment: .leading)
            {
                Text("".uppercased())
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                Picker(
                    selection: $selectedColor,
                    label: Text(""),
                    content:
                    {
                        ForEach(colors)
                        {
                            listedColor in
                            Text(listedColor.title).tag(listedColor.color)
                        }
                    })
                .pickerStyle(.wheel)
            }
        }
        .padding(.horizontal)
    }
}

struct SymbolPickerView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SymbolPickerView(clr: ColorData(id: UUID(), title: "", color: Color.white), rendering: RenderingMode(id: UUID(), title: "Monochrome", symbolrenderingmode: SymbolRenderingMode.monochrome))
    }
}
