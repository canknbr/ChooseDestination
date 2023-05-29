//
//  HeaderView.swift
//  ChooseDestination
//
//  Created by Can Kanbur on 29.05.2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Button {
                print("")
            } label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }.tint(.primary)
            Spacer()
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(minHeight: 28)
            Spacer()
            Button {
                print("")
            } label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24,weight: .regular))
                    
            }.tint(.primary)

            
        }.padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .previewLayout(.fixed(width: 375, height: 60))
    }
}
