//
//  MyNavigationView.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 1/6/21.
//

import SwiftUI

struct MyNavigationView: View {
    var texto: String
    
    var body: some View {
        HStack {
            Text(texto)
                .font(.system(size: 30))
            
            Spacer()
            
            HStack {
                Image(systemName: "arrowtriangle.forward.fill")
            }
        }.padding(.horizontal)
        .foregroundColor(Color.black)
    }
}
