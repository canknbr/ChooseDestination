//
//  SymbolModifier.swift
//  ChooseDestination
//
//  Created by Can Kanbur on 29.05.2023.
//

import SwiftUI

struct SymbolModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.foregroundColor(.white)
            .font(.system(size: 128))
            .shadow(color: .black.opacity(0.2), radius: 12)
    }
}
