//
//  TiposPickerView.swift
//  FileChange
//
//  Created by Jose Alberto Garcia Collado on 5/5/21.
//  Basado en lo encontrado en la página: https://medium.com/@shrineofapple/a-custom-replacement-for-the-horizontal-pickercontrol-f38fb05d22d5

import SwiftUI

struct Tipo: Hashable {
    let id: Int
    var title: String
    var selected: Bool
    
    init (id: Int, title: String, selected: Bool) {
        self.id = id
        self.title = title
        self.selected = selected
    }
}

struct TiposPickerView: View {
    let tiposPosibles: [String] = TipoRopa.allCases.map{ $0.rawValue }
    var Categories: [Tipo] = []
    var lastIndex: Int = 0

    @Binding var selectedTitle: String
    @State var currentIndex: Int = 0
    @Namespace private var ns
    
    var index = 0
    
    let tipoInicial: String
    
    @Binding var tipoRopa: String
    
    init(selectedTitle: Binding<String>, tipoInicial: String, tipoRopa: Binding<String>) {
        _selectedTitle = selectedTitle
        self.tipoInicial = tipoInicial
        _tipoRopa = tipoRopa
        Categories.removeAll()
        
        if tipoInicial == "Ropa" {
            index = 0
            Categories.append(Tipo(id: 0, title: "Ropa", selected: true))
        } else {
            Categories.append(Tipo(id: 0, title: "Ropa", selected: false))
        }
        
        if tipoInicial == "Calzado" {
            index = 1
            Categories.append(Tipo(id: 1, title: "Calzado", selected: true))
        } else {
            Categories.append(Tipo(id: 1, title: "Calzado", selected: false))
        }
        
        if tipoInicial == "Complementos" {
            index = 2
            Categories.append(Tipo(id: 2, title: "Complementos", selected: true))
        } else {
            Categories.append(Tipo(id: 2, title: "Complementos", selected: false))
        }
    }
    var body: some View {
        VStack{
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(spacing: 25) {
                            
                            ForEach(Categories, id: \.self) { item in
                                if item.id == currentIndex {
                                    ZStack() {
                                        Text(item.title)
                                            .bold()
                                            .layoutPriority(1)
                                        VStack() {
                                            Rectangle().frame(height: 2)
                                                .padding(.top, 20)
                                        }
                                        .matchedGeometryEffect(id: "animation", in: ns)
                                    }.foregroundColor(.black)
                                } else {
                                    Text(item.title)
                                        .foregroundColor(.black)
                                        .onTapGesture {
                                            withAnimation {
                                                if item.title != "Ropa"{
                                                    tipoRopa = ""
                                                }
                                                
                                                currentIndex = item.id
                                                selectedTitle = item.title
                                            }
                                        }
                                }
                        }
                        .padding(.leading, 10)
                        .padding(.trailing, 20)
                    }
                }
                
                if selectedTitle == "Ropa"{
                    Divider()
                    
                    VStack(spacing: 10){
                        ForEach(tiposPosibles, id: \.self){ tipo in
                            Button(action:{
                                tipoRopa = tipo
                            }){
                                HStack{
                                    if tipoRopa == tipo{
                                        Text(tipo)
                                            .foregroundColor(.blue)
                                    } else {
                                        Text(tipo)
                                            .foregroundColor(.black)
                                    }
                                    
                                    Spacer()
                                    Image(tipo)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                }
                            }.padding(.horizontal)
                        }
                    }.padding(.top)
                }
            }
            .padding()
            .onAppear{
                currentIndex = index
            }
        }
    }
    
}
