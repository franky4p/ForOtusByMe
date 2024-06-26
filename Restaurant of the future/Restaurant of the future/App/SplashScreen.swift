//
//  SplashScreen.swift
//  Restaurant of the future
//
//  Created by Pavel Khlebnikov on 14.06.2024.
//

import SwiftUI

struct SplashScreen: View {
    @State private var scale = 0.6
    @Binding var isActive: Bool
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "scribble.variable")
                    .font(.system(size: 100))
                    .foregroundColor(.blue)
                Text("Restaurant of the future")
                    .font(.system(size: 20))
                    .padding(1)
            }.scaleEffect(scale)
                .onAppear{
                    withAnimation(.easeIn(duration: 0.7)) {
                        self.scale = 0.9
                    }
                }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreen(isActive: .constant(true))
}
