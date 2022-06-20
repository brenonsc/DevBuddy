//
//  GradientGridView.swift
//  DevBuddy
//
//  Created by Breno Henrique on 17/06/22.
//

import SwiftUI

struct GradientGridView: View
{
    var body: some View
    {
        Button(action:
        {
            Text("Hello There")
        })
        {
            Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                .imageScale(.large)
            
            Text("Reiniciar")
                .font(.system(.title3, design: .rounded))
                .fontWeight(.bold)
        }

    }
}

struct GradientGridView_Previews: PreviewProvider {
    static var previews: some View {
        GradientGridView()
    }
}
