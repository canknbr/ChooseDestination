//
//  TitleModifier.swift
//  ChooseDestination
//
//  Created by Can Kanbur on 29.05.2023.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.foregroundColor(.pink).font(.largeTitle)
    }
}

