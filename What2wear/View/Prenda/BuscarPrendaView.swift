//
//  BuscarView.swift
//  FileChange
//
//  Created by Jose Alberto Garcia Collado on 10/5/21.
//

import SwiftUI
import Firebase

struct BuscarPrendaView: View {
    @State private var nombre: String = ""
    @State private var tipo: String = "Cabeza"
    @StateObject var prendas = PrendaViewModel()
    
    @State private var isEditing = false
    
    @State private var miPrenda = PrendaModel()
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ScrollView {
                VStack {
                HStack {
                    VStack{
                        //TiposPickerView(selectedTitle: $tipo, tipoInicial: "Cabeza")
                    }
                }
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2), spacing: 10){
                    ForEach(prendas.prendas, id: \.self.id){ prenda in
                        PrendaCardView(prenda: prenda)
                    }
                }
                }.navigationBarTitle("Búsqueda", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text("Búsqueda de prendas").font(.headline).foregroundColor(Color.white)
                        }
                    }
                }
            }
        }
    }
}
