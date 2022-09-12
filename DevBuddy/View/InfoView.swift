//
//  InfoView.swift
//  DevBuddy
//
//  Created by Breno Henrique on 27/06/22.
//

import SwiftUI

struct InfoView: View
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
            .navigationTitle("About")
        }
    }
}

struct InfoView_Previews: PreviewProvider
{
    static var previews: some View
    {
        InfoView()
    }
}
