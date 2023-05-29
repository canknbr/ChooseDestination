//
//  ContentView.swift
//  ChooseDestination
//
//  Created by Can Kanbur on 29.05.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var showAlert = false
    @State var showGuide = false
    @State var showInfo = false
    @State private var lastCardIndex = 1
    @State private var cardRemovalTransition = AnyTransition.traillingBottom
    @State var cardViews: [Card] = {
         var views = [Card]()
         for honeymoon in honeyMoonData {
             views.append(Card(honeymoon: honeymoon))
         }
         return views
     }()
    
    
    @GestureState private var dragState = DragState.inactive

    private var dragAreaThreshold: CGFloat = 65.0

    private func moveCard(){
        cardViews.removeFirst()
        lastCardIndex += 1
        let honeymoon = honeyMoonData[lastCardIndex % honeyMoonData.count]
        let newCardView = Card(honeymoon: honeymoon)
        cardViews.append(newCardView)
    }

    private func isTopCard(card: Card) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == card.id }) else { return false }
        return index == 0
    }
    
 

    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)

        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero

            case let .dragging(translation):
                return translation
            }
        }

        var isDragging: Bool {
            switch self {
            case .dragging: return true
            case .pressing, .inactive: return false
            }
        }

        var isPressing: Bool {
            switch self {
            case .pressing, .dragging: return true
            case .inactive: return false
            }
        }
    }

    var body: some View {
        VStack {
            HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
                .opacity(dragState.isDragging ? 0 : 1)
                .animation(.default, value: dragState.isDragging)
            Spacer()
//            Card(honeymoon: honeyMoonData[6])
            ZStack {
                ForEach(cardViews) { cardview in
                    cardview
                        .zIndex(isTopCard(card: cardview) ? 1 : 0)
                        .overlay(
                            ZStack {
                                Image(systemName: "x.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(dragState.translation.width < -dragAreaThreshold && isTopCard(card: cardview) ? 1: 0)

                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(dragState.translation.width > dragAreaThreshold && isTopCard(card: cardview) ? 1: 0)
                            }
                        )
                        .offset(x: isTopCard(card: cardview) ? dragState.translation.width : 0, y: isTopCard(card: cardview) ? dragState.translation.height : 0)
                        .scaleEffect(dragState.isDragging && isTopCard(card: cardview) ? 0.85 : 1)
                        .rotationEffect(Angle(degrees: isTopCard(card: cardview) ? Double(dragState.translation.width / 12) : 0))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120), value: dragState.translation.width)
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating(self.$dragState, body: { value, state, _ in
                                switch value {
                                case .first(true):
                                    state = .pressing
                                case .second(true, let drag):
                                    state = .dragging(translation: drag?.translation ?? .zero)
                                default:
                                    break
                                }
                            })
                                .onChanged({ value in
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    if drag.translation.width < -dragAreaThreshold {
                                        cardRemovalTransition = .leadingBottom
                                    }
                                    if drag.translation.width > dragAreaThreshold {
                                        cardRemovalTransition = .traillingBottom
                                    }
                                })
                                .onEnded({ value in
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    if drag.translation.width < -self.dragAreaThreshold || drag.translation.width > dragAreaThreshold {
                                        playSound(soundName: "sound-rise", soundType: "mp3")
                                        self.moveCard()
                                    }
                                })
                        ).transition(cardRemovalTransition)
                }
            }
            Spacer()
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0 : 1)
                .animation(.default, value: dragState.isDragging)
        }.padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("SUCCESS"), message: Text("Wishing a lovely and most precious of the times together for the amazing couple."), dismissButton: .default(Text("Happy Honeymoon!")))
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
