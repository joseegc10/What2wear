//
//  AddEditConjuntoView.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 3/6/21.
//

import SwiftUI

struct AddEditConjuntoView: View {
    @State var parteActual: String
    @State var parteSiguiente: String
    @StateObject var prendas = PrendaViewModel()
    @State var selected = [String]()
    @State var siguiente = false
    @State var final = false
    @State var prendasConjunto = [PrendaModel]()
    @State var inicio = false
    
    @State private var dic: [String:String] = ["Ropa":"Calzado", "Calzado":"Complementos", "Complementos":"", "":""]
            
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
                                                .stroke(Color("navBar"), lineWidth: selected.contains(prenda.id) ? 4 : 0)
                                                .padding(.leading, 10)
                                                .padding(.trailing, -5)
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
                            //prendas.busquedaPrendas(nombreBuscado: "", tipoBuscado: parteActual)
                        }
                        
                        ZStack {
                            NavigationLink("", destination: AddEditConjuntoView(parteActual: parteSiguiente, parteSiguiente: dic[parteSiguiente]!, selected: selected, prendasConjunto: prendasConjunto), isActive: $siguiente)
                            
                            NavigationLink("", destination: GuardaConjuntoView(prendasConjunto: prendasConjunto), isActive: $final)
                            
                            NavigationLink("", destination: SinNavView(), isActive: $inicio)
                        }
                    }.padding(.trailing)
                    
                    if parteActual == "Ropa"{
                        VStack{
                            Spacer()
                            
                            HStack{
                                HStack{
                                    Text("hola")
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text("adios")
                                        .foregroundColor(.white)
                                }.padding(.horizontal)
                            }
                            .frame(height: 35)
                            .background(Color("navBar"))
                        }
                    }
                }
            }.navigationTitle(parteActual)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button(action: {
                            if parteSiguiente == "" {
                                final = true
                            } else {
                                siguiente = true
                            }
                        }){
                            if parteSiguiente == "" {
                                Text("Fin")
                            } else {
                                Image(systemName: "arrow.right")
                            }
                        }
                        .font(.title)
                        .foregroundColor(Color.white)
                    }
                }
            }.navigationBarBackButtonHidden(false)
        }
    }
}
