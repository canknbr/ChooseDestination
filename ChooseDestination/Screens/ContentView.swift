//
//  ContentView.swift
//  ChooseDestination
//
//  Created by Can Kanbur on 29.05.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            Spacer()
            Card(honeymoon: honeyMoonData[6])
            
            Spacer()
            FooterView()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
