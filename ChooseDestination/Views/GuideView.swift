//
//  GuideView.swift
//  ChooseDestination
//
//  Created by Can Kanbur on 29.05.2023.
//

import SwiftUI

struct GuideView: View {
    @Environment(\.presentationMode) var mode
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                Spacer(minLength: 10)
                Text("Get Started")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                Text("Discover and pick the perfect destination for yoour romantic Honeymoon!")
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                Spacer(minLength: 10)
                VStack(alignment: .leading, spacing: 25) {
                    GuideComponent(title: "Like", subtitle: "Swipe Right", description: "Do you like this destination? Touch the screen and swipe right. It will be saved to the favourites", icon: "heart.circle")
                    GuideComponent(title: "Dismiss", subtitle: "Swipe Left", description: "Would you rather skip this plaec? Touch the screen and swipe left. You will no longer see it.", icon: "xmark.circle")
                    GuideComponent(title: "Book", subtitle: "Tap the button", description: "Our selection of honeymoon resort is perferct setting for you to embark your new life together.", icon: "checkmark.circle")
                }
                Spacer(minLength: 10)
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Text("Continue".uppercased())
                        .modifier(ButtonModifier())
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(.top, 15)
        .padding(.bottom, 25)
        .padding(.horizontal, 25)
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
