//
//  AddCalzadoConjuntoView.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 11/6/21.
//

import SwiftUI

struct AddCalzadoConjuntoView: View {
    @State private var siguiente = false
    @State private var anterior = false
    @StateObject var prendas = PrendaViewModel()
    @State var selected: [String]
    @State var prendasConjunto: [PrendaModel]
    @State private var elegido = false
    
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
                                                elegido = false
                                                let index = selected.firstIndex(of: prenda.id)!
                                                selected.remove(at: index)
                                                prendasConjunto.remove(at: index)
                                            } else {
                                                if !elegido{
                                                    selected.append(prenda.id)
                                                    prendasConjunto.append(prenda)
                                                    elegido = true
                                                }
                                            }
                                        }
                                }
                            }
                        }.onAppear{
                            prendas.busquedaPrendas(tipoBuscado: "Calzado")
                        }
                        
                        ZStack {
                            NavigationLink("", destination: AddComplementosConjuntoView(selected: selected, prendasConjunto: prendasConjunto), isActive: $siguiente)
                            
                            NavigationLink("", destination: AddRopaConjuntoView(selected: selected, prendasConjunto: prendasConjunto), isActive: $anterior)
                        }
                    }.padding(.trailing)
                }
            }.navigationTitle("Calzado")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button(action: {
                            siguiente = true
                        }){
                            Image(systemName: "arrow.right")
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
