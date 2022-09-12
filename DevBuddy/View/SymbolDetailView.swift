//
//  SymbolDetailView.swift
//  DevBuddy
//
//  Created by Breno Henrique on 17/06/22.
//

import SwiftUI
import AlertToast

struct SymbolDetailView: View
{
    var sf: SymbolData
    let clipboard = UIPasteboard.general
    @State private var showToast = false
    @State var selectedColor: Color = Color.white
    @State var selectedMode: String = "Monochrome"
    
    var body: some View
    {
        GeometryReader
        {
            (geo : GeometryProxy) in
            ScrollView
            {
                VStack(alignment: .leading, spacing: 16)
                {
                    ZStack
                    {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.gray)
                            .opacity(0.8)
                            .scaledToFit()
                            .frame(width: geo.size.width, height: geo.size.width * 0.92)
                        
                        if(selectedMode == "Monochrome")
                        {
                            Image(systemName: sf.symbol)
                                .resizable()
                                .foregroundColor(selectedColor)
                                .symbolRenderingMode(.monochrome)
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.8, height: geo.size.width * 0.8)
                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                                .scaleEffect(0.7)
                        }
                        
                        else if(selectedMode == "Hierarchical")
                        {
                            Image(systemName: sf.symbol)
                                .resizable()
                                .foregroundColor(selectedColor)
                                .symbolRenderingMode(.hierarchical)
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.8, height: geo.size.width * 0.8)
                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                                .scaleEffect(0.7)
                        }
                        
                        else
                        {
                            Image(systemName: sf.symbol)
                                .resizable()
                                .foregroundColor(selectedColor)
                                .symbolRenderingMode(.multicolor)
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.8, height: geo.size.width * 0.8)
                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                                .scaleEffect(0.7)
                        }
                    }
                    
                    GroupBox
                    {
                        VStack(alignment: .leading)
                        {
                            Text("Rendering Mode".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                            
                            HStack
                            {
                                Picker(
                                    selection: $selectedMode,
                                    label: Text("Rendering Mode"),
                                    content:
                                    {
                                        Text("Monochrome").tag("Monochrome")
                                        Text("Hierarchical").tag("Hierarchical")
                                        
                                        if(sf.multicolor)
                                        {
                                            Text("Multicolor").tag("Multicolor")
                                        }
                                    })
                                .pickerStyle(.segmented)
                            }
                            
                            /*
                            Por algum motivo, o compilador foi incapaz de gerar esse
                            Picker em "tempo razoável", de acordo com ele. Por isso tive
                            que criar a solução (acima) usando uma variável String, que
                            está longe de ser a ideal, mas que deixa o código ao menos
                            funcional, por hora.
                            
                            Picker(
                                selection: $selectedModeR,
                                label: Text("Rendering Mode"),
                                content:
                                {
                                    ForEach(rdr)
                                    {
                                        listedRendering in
                                        Text(listedRendering.title).tag(listedRendering.symbolrenderingmode)
                                    }
                                    
                                    if(sf.multicolor)
                                    {
                                        Text("Multicolor").tag(SymbolRenderingMode.multicolor)
                                    }
                                })
                            .pickerStyle(.segmented)
                             */
                        }
                    }
                    .padding(.horizontal)
                    
                    GroupBox
                    {
                        VStack(alignment: .leading)
                        {
                            Text("Color".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                            
                            Picker(
                                selection: $selectedColor,
                                label: Text("Color"),
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
                    
                    GroupBox
                    {
                        VStack(alignment: .leading)
                        {
                            Text("Symbol Name".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                            
                            HStack
                            {
                                Text("\(sf.symbol)")
                                    .fontWeight(.light)
                                    .fixedSize(horizontal: false, vertical: true) 
                                
                                Spacer()
                                Button(action:
                                {
                                    clipboard.string = sf.symbol
                                    showToast.toggle()
                                })
                                {
                                    Image(systemName: "doc.on.doc")
                                        .imageScale(.large)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    GroupBox
                    {
                        VStack(alignment: .leading)
                        {
                            HStack
                            {
                                Text("Code".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.leading)
                                
                                Spacer()
                                
                                Button(action:
                                {
                                    clipboard.string = """
                                                        Image(systemname: \(sf.symbol))
                                                            .foregroundColor(.\(String(describing: selectedColor)))
                                                            .renderingMode(.\(selectedMode.lowercased()))
                                                        """
                                    showToast.toggle()
                                })
                                {
                                    Image(systemName: "doc.on.doc")
                                        .imageScale(.large)
                                }
                            }
                            
                            Spacer()
                            
                            HStack
                            {
                                Text("""
                                    Image(systemname: \(sf.symbol))
                                        .foregroundColor(.\(String(describing: selectedColor)))
                                        .renderingMode(.\(selectedMode.lowercased()))
                                    """
                                     )
                                .fontWeight(.light)
                                
                                Spacer()
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    if(sf.restriction != "")
                    {
                        VStack(alignment: .leading, spacing: 4)
                        {
                            Text("Use Restriction".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                            
                            Text("\(sf.restriction)")
                                .fontWeight(.light)
                                .foregroundColor(.gray)
                                .fixedSize(horizontal: false, vertical: true) //quando há um MultilineText dentro de um ScrollView, o mesmo não permite o texto passar de uma linha, com esse código, passa a permitir
                        }
                        .padding()
                    }
                }
            }
        }
        .navigationBarTitle("Symbol")
        .navigationBarTitleDisplayMode(.inline)
        .toast(isPresenting: $showToast)
        {
            AlertToast(displayMode: .alert,
                       type: .complete(.green),
                       title: "COPIED TO CLIPBOARD")
        }
    }
}


struct SymbolDetailView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SymbolDetailView(sf: SymbolData(id: "x", symbol: "keyboard", multicolor: false, restriction: ""))
    }
}
