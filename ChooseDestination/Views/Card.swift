//
//  Card.swift
//  ChooseDestination
//
//  Created by Can Kanbur on 29.05.2023.
//

import SwiftUI

struct Card: View,Identifiable {
    let id = UUID()
    var honeymoon: Destination
    var body: some View {
        Image(honeymoon.image)
            .resizable()
            .scaledToFit()
            .frame(minWidth: 0, maxWidth: .infinity)
            .cornerRadius(20)
            .overlay(
                VStack(alignment: .center, spacing: 12) {
                    Text(honeymoon.place.uppercased())
                        .font(.largeTitle)
                        .bold()
                        .shadow(radius: 1)
                        .padding(.horizontal,18)
                        .padding(.vertical,4)
                        .overlay(
                            Rectangle()
                                .fill(.white)
                                .frame(height: 1)
                            ,alignment: .bottom
                        )
                        .foregroundColor(.white)
                    Text(honeymoon.country.uppercased())
                        .foregroundColor(.black)
                        .font(.footnote)
                        .bold()
                        .frame(minWidth: 85)
                        .padding(.horizontal,10)
                        .padding(.vertical,5)
                        .background(
                            Capsule().fill(.white)
                        )
                }
                .frame(minWidth: 280)
                .padding(.bottom, 15), alignment: .bottom
            )
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(honeymoon: honeyMoonData[0])
            .previewLayout(.fixed(width: 375, height: 600))
    }
}
