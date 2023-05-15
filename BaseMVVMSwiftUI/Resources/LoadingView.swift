//
//  LoadingView.swift
//  BaseMVVMSwiftUI
//
//  Created by Junior Margalho on 15/05/23.
//

import SwiftUI

struct LoadingView: View {
    @State var isAnimated = false
    
    var body: some View {
        VStack {
            Image(systemName: "arrow.clockwise.circle.fill")
                .resizable()
                .frame(width: 56, height: 56)
                .rotationEffect(.degrees(isAnimated ? 360 : 0))
                .animation(
                    .easeInOut(duration: 1.2)
                    .repeatForever(autoreverses: false),
                    value: isAnimated)
                .padding(.bottom, 20)
            Text("Aguarde, por favor...")
                .font(Font.system(size: 16, weight: .medium))
                .foregroundColor(.black)
        }
        .onAppear {
            isAnimated = true
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
