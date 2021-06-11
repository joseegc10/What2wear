//
//  InitView.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 1/6/21.
//

import SwiftUI
import Firebase

struct InitView: View {
    @State var addPrenda = false
    @State var addConjunto = false
    
    @State private var ropa = false
    @State private var complementos = false
    @State private var calzado = false
    @State private var conjuntos = false
        
    init() {
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing: 25){
                    
                    VStack(alignment: .leading, spacing: 20){
                        VStack(alignment: .leading){
                            Button(action:{
                                conjuntos = true
                            }){
                                VStack(alignment: .leading, spacing: 5){
                                    Text("Conjuntos")
                                        .foregroundColor(Color.black)
                                        .font(.title)
                                        .padding(.leading)

                                    Image("maniquies")
                                        .resizable()
                                        .frame(height: 120)
                                }.foregroundColor(.black)
                            }.padding(.top)
                            
                            Button(action:{
                                ropa = true
                            }){
                                VStack(alignment: .leading, spacing: 5){
                                    Text("Ropa")
                                        .foregroundColor(Color.black)
                                        .font(.title)
                                        .padding(.leading)

                                    Image("ropa")
                                        .resizable()
                                        .frame(height: 120)
                                }.foregroundColor(.black)
                            }
                            
                            Button(action:{
                                complementos = true
                            }){
                                VStack(alignment: .leading, spacing: 5){
                                    Text("Complementos")
                                        .foregroundColor(Color.black)
                                        .font(.title)
                                        .padding(.leading)

                                    Image("complementos")
                                        .resizable()
                                        .frame(height: 120)
                                }.foregroundColor(.black)
                            }
                            
                            Button(action:{
                                calzado = true
                            }){
                                VStack(alignment: .leading, spacing: 5){
                                    Text("Calzado")
                                        .foregroundColor(Color.black)
                                        .font(.title)
                                        .padding(.leading)

                                    Image("calzado")
                                        .resizable()
                                        .frame(height: 120)
                                }.foregroundColor(.black)
                            }
                        }
                    }
                    
                    ZStack{
                        NavigationLink("", destination: AddEditPrendaView(editar: false), isActive: $addPrenda)
                        NavigationLink("", destination: AddRopaConjuntoView(), isActive: $addConjunto)
                        
                        NavigationLink("", destination: RopaView(), isActive: $ropa)
                        NavigationLink("", destination: TypeView(tipo: "Complementos"), isActive: $complementos)
                        NavigationLink("", destination: TypeView(tipo: "Calzado"), isActive: $calzado)
                        
                        NavigationLink("", destination: BuscarConjuntoView(), isActive: $conjuntos)
                    }
                }
                .navigationBarTitle("Inicio", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Button("What2wear", action: {
                                
                            })
                            .font(.title)
                            .foregroundColor(Color.white)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            Menu {
                                Button(action: {
                                    addPrenda = true
                                }){
                                    HStack{
                                        Text("Prenda")
                                        Image("prenda")
                                    }
                                }
                                
                                Button(action: {
                                    addConjunto = true
                                }){
                                    HStack{
                                        Text("Conjunto")
                                        Image("conjunto")
                                    }
                                }
                                
                            } label: {
                                Label("", systemImage: "plus")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
            }.navigationBarColor(backgroundColor: UIColor(Color("navBar")), tintColor: UIColor(Color.white))
        }
    }
}
