//
//  HalfModalView.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 25/05/23.
//

import SwiftUI

struct HalfModalView<Content: View> : View {
    @Binding var isShown:Bool
    var color: Color = .white
    var modalHeight: CGFloat = 400
    var shouldDismiss: Bool = false
    var content: () -> Content
    @Environment(\.dismiss) private var dismiss
    @GestureState private var dragState = DragState.inactive

    enum DragState {
        case inactive
        case dragging(translation: CGSize)
        var translation: CGSize {
            switch self {
            case .inactive:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        var isDragging: Bool {
            switch self {
            case .inactive:
                return false
            case .dragging:
                return true
            }
        }
    }
    
    var body: some View {
        let drag = DragGesture()
            .updating($dragState) { drag, state, transaction in
                state = .dragging(translation: drag.translation)
            }
            .onEnded(onDragEnded)
        return Group {
            ZStack {
                GeometryReader{ geometry in
                    Spacer()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .background(isShown ? Color.black.opacity( 0.5 * fraction_progress(lowerLimit: 0, upperLimit: Double(modalHeight), current: Double(dragState.translation.height), inverted: true)) : Color.clear)
                        .animation(.interpolatingSpring(stiffness: 300.0,
                                                        damping: 30.0,
                                                        initialVelocity: 10.0))
                        .gesture(
                            TapGesture()
                                .onEnded { _ in
                                    UIApplication.shared.endEditing()
                                    withAnimation(.easeInOut){
                                        self.isShown = false
                                        if shouldDismiss{
                                            dismiss()
                                        }
                                    }
                                }
                        )
                    VStack {
                        Spacer()
                        ZStack(alignment: .top) {
                            color.opacity(1.0)
                                .frame(width: geometry.size.width, height: modalHeight + 20)
                                .roundedCorner(25, corners: [.topLeft, .topRight])
                                .shadow(radius: 5)
                            self.content()
                                .padding()
                                .frame(width: geometry.size.width, height:modalHeight)
                                .clipped()
                        }
                        .offset(y: isShown ? ((self.dragState.isDragging && dragState.translation.height >= 1) ? dragState.translation.height : 0) : modalHeight)
                        .animation(.interpolatingSpring(stiffness: 300.0,
                                                        damping: 30.0,
                                                        initialVelocity: 10.0))
                        .gesture(drag)
                    }
                }
            }
            .opacity(isShown ? 1 : 0)
        }
        .ignoresSafeArea()
    }
    
    private func onDragEnded(drag: DragGesture.Value) {
        let dragThreshold = modalHeight * (2/3)
        if drag.predictedEndTranslation.height > dragThreshold || drag.translation.height > dragThreshold{
            withAnimation(.easeInOut){
                self.isShown = false
                if shouldDismiss{
                    dismiss()
                }
            }
        }
    }
    
    private func fraction_progress(lowerLimit: Double = 0,
                                   upperLimit:Double,
                                   current:Double,
                                   inverted:Bool = false) -> Double {
        var val:Double = 0
        if current >= upperLimit {
            val = 1
        } else if current <= lowerLimit {
            val = 0
        } else {
            val = (current - lowerLimit)/(upperLimit - lowerLimit)
        }
        if inverted {
            return (1 - val)
        } else {
            return val
        }
    }
}
