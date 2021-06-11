//
//  GuardaConjuntoView.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 3/6/21.
//

import SwiftUI

struct GuardaConjuntoView: View {
    var prendasConjunto: [PrendaModel]
    @State private var nombre = ""
    @StateObject var prendas = PrendaViewModel()
    @State private var acaba = false
    
    var body: some View {
        ZStack {
            ScrollView{
                Spacer()
                
                VStack {
                    VStack(alignment:.leading, spacing: 10) {
                        Text("Nombre del conjunto")
                            .bold()
                            .font(.body)
                            .foregroundColor(.black)
                        
                        TextField("", text: $nombre)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color("navBar"), lineWidth: 2)
                            )
                    }.padding(.horizontal, 30)
                    
                    Spacer(minLength: 30)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2), spacing: 10){
                        ForEach(prendasConjunto, id: \.self.id){ prenda in
                            PrendaCardNoEditView(prenda: prenda)
                        }
                    }
                }
            }
            
            NavigationLink("", destination: SinNavView(), isActive: $acaba)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: {
                        prendas.addConjunto(prendasConjunto: prendasConjunto, nombre: nombre)
                        acaba = true
                    }, label: {
                        Image(systemName: "plus")
                            .font(.system(size: 25))
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color.white)
                    })
                    .background(Color("navBar"))
                    .cornerRadius(30)
                    .padding()
                    .shadow(color: Color.black.opacity(0.3),
                            radius: 3,
                            x: 3,
                            y: 3)
                    .disabled(nombre == "")
                    .padding(.trailing, 20)
                }
            }
        }
    }
}
