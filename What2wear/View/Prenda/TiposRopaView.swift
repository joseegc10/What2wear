//
//  TiposRopaView.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 10/6/21.
//

import SwiftUI

struct TiposRopaView: View {
    var tipo: String
    @StateObject var prendas = PrendaViewModel()
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            ScrollView {
                Spacer(minLength: 20)
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2), spacing: 10){
                    ForEach(prendas.prendas, id: \.self.id){ prenda in
                        PrendaCardView(prenda: prenda)
                    }
                }.onAppear{
                    prendas.busquedaPrendasRopa(tipoBuscado: tipo)
                }
            }.padding(.trailing)
        }.navigationTitle(tipo)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text(tipo).font(.headline).foregroundColor(Color.white)
                }
            }
        }
    }
}
