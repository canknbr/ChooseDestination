//
//  FooterView.swift
//  ChooseDestination
//
//  Created by Can Kanbur on 29.05.2023.
//

import SwiftUI

struct FooterView: View {
    @Binding var showBookingAlert : Bool
    let feedbeck = UINotificationFeedbackGenerator()
    var body: some View {
        HStack {
            Image(systemName: "xmark.circle")
                .font(.system(size: 42, weight: .light))

            Spacer()
            Button {
                playSound(soundName: "sound-click", soundType: "mp3")
                feedbeck.notificationOccurred(.success)
                showBookingAlert.toggle()
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

