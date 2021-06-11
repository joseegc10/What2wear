//
//  AddRopaConjuntoView.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 11/6/21.
//

import SwiftUI

struct AddRopaConjuntoView: View {
    @State var parteAnterior: String = ""
    @State var parteActual: String = ""
    @State var parteSiguiente: String = ""
    @StateObject var prendas = PrendaViewModel()
    @State var selected = [String]()
    @State var siguiente = false
    @State var anterior = false
    @State var prendasConjunto = [PrendaModel]()
    
    @State private var dicAnterior: [String:String] = [:]
    
    @State private var dic: [String:String] = [:]
    
    var body: some View {
        ZStack{
            Color("navBar").edgesIgnoringSafeArea(.all)
            VStack {
                ZStack{
                    Color.white
                    ScrollView{
                        Spacer(minLength: 20)
                        
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
                            prendas.getTiposRopa { bool in
                                if bool {
                                    let tiposSize = prendas.tiposRopa.count
                                    let tipos = prendas.tiposRopa
                                    var i = 0
                                    dic = [:]
                                    dicAnterior = [:]
                                    
                                    if tiposSize > 0 {
                                        while i < (tiposSize-1){
                                            dic[tipos[i]] = tipos[i+1]
                                            dicAnterior[tipos[i+1]] = tipos[i]
                                            i += 1
                                        }
                                        
                                        dic[tipos[tiposSize-1]] = ""
                                        dic[""] = tipos[0]
                                        
                                        dicAnterior[tipos[0]] = ""
                                        dicAnterior[""] = tipos[tiposSize-1]
                                        
                                        parteActual = tipos[0]
                                        parteAnterior = dicAnterior[parteActual]!
                                        parteSiguiente = dic[parteActual]!
                                    } else {
                                        parteActual = "Sin ropa"
                                    }
                                    
                                    prendas.busquedaPrendasRopa(tipoBuscado: parteActual)
                                } else {
                                    parteActual = "Sin ropa"
                                }
                                
                            }
                        }.onChange(of: parteActual){valor in
                            prendas.busquedaPrendasRopa(tipoBuscado: parteActual)
                        }
                        
                        NavigationLink("", destination: AddCalzadoConjuntoView(selected: selected, prendasConjunto: prendasConjunto), isActive: $siguiente)
                        
                        NavigationLink("", destination: EliminaNavInitView(), isActive: $anterior)
                    }.padding(.trailing)
                    
                    VStack{
                        Spacer()
                        
                        HStack{
                            HStack{
                                Button(action: {
                                    parteActual = parteAnterior
                                    parteAnterior = dicAnterior[parteActual]!
                                    parteSiguiente = dic[parteActual]!
                                }){
                                    if parteAnterior == "" {
                                        Image(systemName: "arrow.left")
                                            .foregroundColor(.gray)
                                    } else {
                                        Image(systemName: "arrow.left")
                                    }
                                }.disabled(parteAnterior == "")
                                .font(.title)
                                .foregroundColor(Color.white)
                                
                                Spacer()
                                
                                Text(parteActual)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                
                                Spacer()
                                
                                Button(action: {
                                    parteActual = parteSiguiente
                                    parteAnterior = dicAnterior[parteActual]!
                                    parteSiguiente = dic[parteActual]!
                                }){
                                    if parteSiguiente == "" {
                                        Image(systemName: "arrow.right")
                                            .foregroundColor(.gray)
                                    } else {
                                        Image(systemName: "arrow.right")
                                    }
                                }.disabled(parteSiguiente == "")
                                .font(.title)
                                .foregroundColor(Color.white)
                            }.padding(.horizontal)
                        }
                        .frame(height: 35)
                        .background(Color("navBar"))
                    }
                }
            }.navigationTitle("Ropa")
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
                            Text("Inicio")
                        }
                        .font(.title)
                        .foregroundColor(Color.white)
                    }
                }
            }.navigationBarBackButtonHidden(true)
        }
    }
}

