//
//  PrendaCardNoEditView.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 3/6/21.
//

import SwiftUI

struct PrendaCardNoEditView: View {
    var prenda: PrendaModel
    
    @State private var miUrl = URL(string: "https://www.google.es/")
    
    @State private var elige = false
    @State private var comparte = false
    
    @State private var items = [Any]()
        
    @StateObject var imageLoader: DocumentViewModel = DocumentViewModel(documentURL: "")
    
    var body: some View {
        VStack (alignment: .center){
            ImagenStorageView(imageURL: prenda.dirImagen, anchura: 130, nombreAlternativa: "prenda")
            Spacer()
        }.padding(.leading)
    }
}

