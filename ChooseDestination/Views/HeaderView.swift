//
//  HeaderView.swift
//  ChooseDestination
//
//  Created by Can Kanbur on 29.05.2023.
//

import SwiftUI

struct HeaderView: View {
    @Binding var showGuideView: Bool
    @Binding var showInfoView : Bool
    let feedbeck = UINotificationFeedbackGenerator()
    var body: some View {
        HStack {
            Button {
                playSound(soundName: "sound-click", soundType: "mp3")
                feedbeck.notificationOccurred(.success)
                showInfoView.toggle()
            } label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }.tint(.primary)
                .sheet(isPresented: $showInfoView) {
                    InfoView()
                }
            Spacer()
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(minHeight: 28)
            Spacer()
            Button {
                playSound(soundName: "sound-click", soundType: "mp3")
                feedbeck.notificationOccurred(.success)
                showGuideView.toggle()
            } label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))

            }
            .tint(.primary)
            .sheet(isPresented: $showGuideView) {
                GuideView()
            }
        }.padding()
    }
}
