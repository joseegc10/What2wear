//
//  BuscarConjuntoView.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 3/6/21.
//

import SwiftUI

struct BuscarConjuntoView: View {
    @State private var nombre: String = ""
    @StateObject var prendas = PrendaViewModel()
    
    @State private var isEditing = false
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ScrollView {
                VStack {
                    HStack {
                        TextField("Nombre", text: $nombre)
                            .disableAutocorrection(true)
                            .padding(7)
                            .padding(.horizontal, 25)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .overlay(
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.gray)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 8)
                             
                                    if isEditing {
                                        Button(action: {
                                            self.nombre = ""
                                        }) {
                                            Image(systemName: "multiply.circle.fill")
                                                .foregroundColor(.gray)
                                                .padding(.trailing, 8)
                                        }
                                    }
                                }
                            )
                            .padding(.horizontal, 10)
                            .onTapGesture {
                                self.isEditing = true
                            }
             
                        Button(action: {
                            prendas.busquedaConjuntos(nombreBuscado: nombre)
                        }) {
                            Text("Buscar")
                                .foregroundColor(.black)
                        }
                        .padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                        .animation(.default)
                    }.padding()
                }
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2), spacing: 10){
                    ForEach(prendas.conjuntos, id: \.self.id){ conjunto in
                        ConjuntoCardView(conjunto: conjunto, tam: 75)
                    }
                }
            }.navigationBarTitle("Conjuntos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Conjuntos").font(.headline).foregroundColor(Color.white)
                    }
                }
            }
            .onAppear{
                prendas.busquedaConjuntos(nombreBuscado: "")
            }
        }
    }
}
