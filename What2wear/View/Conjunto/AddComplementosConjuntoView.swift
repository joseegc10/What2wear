//
//  AddComplementosConjuntoView.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 11/6/21.
//

import SwiftUI

struct AddComplementosConjuntoView: View {
    @State private var final = false
    @State private var anterior = false
    @StateObject var prendas = PrendaViewModel()
    @State var selected: [String]
    @State var prendasConjunto: [PrendaModel]
    
    var body: some View {
        ZStack{
            Color("navBar").edgesIgnoringSafeArea(.all)
            VStack {
                ZStack{
                    Color.white
                    ScrollView{
                        Spacer()
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2), spacing: 10){
                            ForEach(prendas.prendas, id: \.self.id){ prenda in
                                ZStack {
                                    PrendaCardNoEditView(prenda: prenda)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 2)
                                                .stroke(Color.blue, lineWidth: selected.contains(prenda.id) ? 4 : 0)
                                                .padding(.leading, 15)
                                                .padding(.bottom, 10)
                                        )
                                        .onTapGesture {
                                            if selected.contains(prenda.id){
                                                let index = selected.firstIndex(of: prenda.id)!
                                                selected.remove(at: index)
                                                prendasConjunto.remove(at: index)
                                            } else {
                                                selected.append(prenda.id)
                                                prendasConjunto.append(prenda)
                                            }
                                        }
                                }
                            }
                        }.onAppear{
                            prendas.busquedaPrendas(tipoBuscado: "Complementos")
                        }
                        
                        ZStack {
                            NavigationLink("", destination: GuardaConjuntoView(prendasConjunto: prendasConjunto), isActive: $final)
                            
                            NavigationLink("", destination: AddCalzadoConjuntoView(selected: selected, prendasConjunto: prendasConjunto), isActive: $anterior)
                        }
                    }.padding(.trailing)
                }
            }.navigationTitle("Complementos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button(action: {
                            final = true
                        }){
                            Text("Fin")
                        }
                        .font(.title)
                        .foregroundColor(Color.white)
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Button(action: {
                            anterior = true
                        }){
                            Image(systemName: "arrow.left")
                        }
                        .font(.title)
                        .foregroundColor(Color.white)
                    }
                }
            }.navigationBarBackButtonHidden(true)
        }
    }
}
