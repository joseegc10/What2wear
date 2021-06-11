//
//  UtilidadApp.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 1/6/21.
//  Basado en lo encontrado en la página https://betterprogramming.pub/creating-an-apple-like-splash-screen-in-swiftui-fdeb36b47e81

import SwiftUI

struct UtilidadApp: View {
    var title: String = "title"
    var subTitle: String = "subTitle"
    var imageName: String = "car"

    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: imageName)
                .font(.largeTitle)
                .foregroundColor(.mainColor)
                .padding()
                .accessibility(hidden: true)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .accessibility(addTraits: .isHeader)

                Text(subTitle)
                    .font(.body)
                    .foregroundColor(.gray)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.top)
    }
}
