//
//  PrendaView.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 10/6/21.
//

import SwiftUI

struct PrendaView: View {
    @State var prenda: PrendaModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Spacer()
                
                ImagenStorageView(imageURL: prenda.dirImagen, anchura: 240, nombreAlternativa: "prenda")
                
                VStack(spacing: 15){
                    Text(prenda.descripcion)
                        .padding(.horizontal, 30)
                        .foregroundColor(.black)
                }
            }
        }
    }
}
