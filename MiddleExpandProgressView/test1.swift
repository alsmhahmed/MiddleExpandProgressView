//
//  test1.swift
//  ChauffeurProgress
//
//  Created by alsmh ahmed on 04/12/2024.
//

import SwiftUI

struct test1: View {
    // Parameters to customize the component
    @State var progress: CGFloat = 0.2
    var progressColor: Color = .progressblue
    var backgroundColor: Color = Color(.systemGray6)
    var animationDuration: Double = 0.7
    var cornerRadius: CGFloat = 10
    var height: CGFloat = 8
    var repeatValue: Bool = true
    var startPoint: UnitPoint = .leading // New parameter
    var endPoint: UnitPoint = .trailing // New parameter

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
                            startPoint: startPoint, // Controlled by parameter
                            endPoint: endPoint      // Controlled by parameter
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
    VStack(spacing: 20) {
        test1(
            progressColor: .blue,
            backgroundColor: Color(.systemGray6),
            animationDuration: 1.0,
            cornerRadius: 12,
            height: 10,
            repeatValue: true,
            startPoint: .leading,  // Gradient starts from the left
            endPoint: .trailing    // Gradient ends on the right
        )

        test1(
            progressColor: .red,
            backgroundColor: Color(.systemGray4),
            animationDuration: 0.8,
            cornerRadius: 8,
            height: 6,
            repeatValue: false,
            startPoint: .top,      // Gradient starts from the top
            endPoint: .bottom      // Gradient ends at the bottom
        )

        test1(
            progressColor: .green,
            backgroundColor: Color(.systemGray5),
            animationDuration: 0.5,
            cornerRadius: 8,
            height: 8,
            repeatValue: true,
            startPoint: .bottomLeading, // Diagonal gradient from bottom-left
            endPoint: .topTrailing      // To top-right
        )
    }
    .padding()
}

