//
//  ViewBuilderView.swift
//  MiddleExpandProgressView
//
//  Created by alsmh ahmed on 08/01/2025.
//

import SwiftUI

struct AdvancedCard<Header: View, Content: View, Footer: View>: View {
    let header: Header
    let content: Content
    let footer: Footer

    init(
        @ViewBuilder header: () -> Header,
        @ViewBuilder content: () -> Content,
        @ViewBuilder footer: () -> Footer
    ) {
        self.header = header()
        self.content = content()
        self.footer = footer()
    }

    var body: some View {
        VStack(spacing: 10) {
            header
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

            content
                .padding()
                .background(Color.white)
                .cornerRadius(10)

            footer
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)
    }
}




