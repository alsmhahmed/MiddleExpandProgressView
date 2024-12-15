//
//  ContentView.swift
//  MiddleExpandProgressView
//
//  Created by alsmh ahmed on 08/12/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            MiddleExpandProgressView()
            MiddleExpandProgressView(repeatValue:false)
            MiddleExpandProgressView(
                progress: -1,
                repeatValue:false
            )
            MiddleExpandProgressView(
                progressColor: .red,
                backgroundColor: Color(.systemGray6),
                animationDuration: 0.3,
                cornerRadius: 10,
                height: 12,
                repeatValue: true
            )
        }
    }
}

#Preview {
    ContentView()
}
