//
//  FooterView.swift
//  ChooseDestination
//
//  Created by Can Kanbur on 29.05.2023.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        HStack {
            Image(systemName: "xmark.circle")
                .font(.system(size: 42, weight: .light))

            Spacer()
            Button {
                print("aslşd")
            } label: {
                Text("Book Destination".uppercased())
                    .fontDesign(.rounded)
                    .font(.subheadline)
                    .fontWeight(.heavy)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .tint(.pink)
                    .background(
                        Capsule().stroke(.pink,lineWidth: 2)
                    )
            }

            Spacer()
            Image(systemName: "heart.circle")
                .font(.system(size: 42, weight: .light))
        }
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
