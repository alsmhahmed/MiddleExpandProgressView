//
//  MiddleExpandProgressView.swift
//  MiddleExpandProgressView
//
//  Created by alsmh ahmed on 08/12/2024.
//

import SwiftUI

struct MiddleExpandProgressView: View {
    // Parameters to customize the component
    @State  var progress: CGFloat = 0.2
    var progressColor: Color = .progressblue
    var backgroundColor: Color = Color(.systemGray6)
    var animationDuration: Double = 0.7
    var cornerRadius: CGFloat = 10
    var height: CGFloat = 8
    var repeatValue: Bool = true

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background bar
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundColor)
                    .frame(height: height)

                // Expanding and contracting gradient bar
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                progressColor.opacity(0),
                                progressColor,
                                progressColor.opacity(0)
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: geometry.size.width * progress, height: height)
                    .animation(
                        Animation.easeInOut(duration: animationDuration)
                            .repeatForever(autoreverses: repeatValue),
                        value: progress
                    )
            }
            .onAppear {
                // Start animation
                withAnimation {
                    progress = 1.0 // Expand to full width
                }
            }
        }
        .frame(height: height + 8) // Add padding around the bar
        .padding()
    }
}

#Preview {
    // Example usage of the reusable component
    VStack {
        MiddleExpandProgressView(
            progressColor: .progressblue,
            backgroundColor: Color(.systemGray6),
            animationDuration: 0.7,
            cornerRadius: 10,
            height: 8,
            repeatValue: true
        )
    }
}
