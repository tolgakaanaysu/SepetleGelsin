//
//  CustomProgressView.swift
//  SepetleGelsin
//
//  Created by Tolga Kağan Aysu on 25.01.2025.
//

import SwiftUI

struct EmptyView: View {
    var imageName: String
    var message: String

    var body: some View {
        VStack {
            imageView
            descriptionText
        }
        .padding()
    }
}

private extension EmptyView {

    var imageFrame: CGFloat {
        screenBounds.width * 0.3
    }

    var imageView: some View {
        Image(systemName: imageName)
            .resizable()
            .frame(width: imageFrame, height: imageFrame)
            .foregroundColor(.primary)
    }

    var descriptionText: some View {
        Text(message)
            .font(.title3)
            .foregroundColor(.secondary)
    }
}
