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
        NavigationView
        {
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
            .navigationTitle("Gradients")
        }
    }
}

struct GradientGridView_Previews: PreviewProvider {
    static var previews: some View
    {
        GradientGridView()
    }
}
