//
//  RopaView.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 10/6/21.
//

import SwiftUI



struct RopaView: View {
    @State var pantalones = false
    @State var camisetas = false
    @State var sudaderas = false
    @State var chaquetas = false
    @State var camisas = false
    @State var interior = false
    @State var trajes = false
    @State var jerseys = false
    @State var banio = false
    @State var pijamas = false
    @State var faldas = false
    @State var vestidos = false
    
    let tiposPosibles: [String] = TipoRopa.allCases.map{ $0.rawValue }
    var tipo: String = ""
    @StateObject var prendas = PrendaViewModel()
    @State private var nombre = ""
    @State private var isEditing = false
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            ScrollView {
                VStack{
                    Spacer()
                    
                    HStack{
                        Button(action:{
                            pantalones = true
                        }){
                            VStack(spacing: 3){
                                Text("Pantalones")
                                    .font(.system(size: 20))
                                Image("Pantalones")
                                    .resizable()
                                    .frame(width: 170, height: 170)
                                    
                            }
                        }
                        
                        
                        Button(action:{
                            camisetas = true
                        }){
                            VStack(spacing: 3){
                                Text("Camisetas")
                                    .font(.system(size: 20))
                                Image("Camisetas")
                                    .resizable()
                                    .frame(width: 170, height: 170)
                            }
                        }
                    }
                    
                    HStack{
                        Button(action:{
                            sudaderas = true
                        }){
                            VStack(spacing: 3){
                                Text("Sudaderas")
                                    .font(.system(size: 20))
                                Image("Sudaderas")
                                    .resizable()
                                    .frame(width: 170, height: 170)
                                    
                            }
                        }
                        
                        Button(action:{
                            chaquetas = true
                        }){
                            VStack(spacing: 3){
                                Text("Chaquetas")
                                    .font(.system(size: 20))
                                Image("Chaquetas")
                                    .resizable()
                                    .frame(width: 170, height: 170)
                            }
                        }
                    }.padding(.top)
                    
                    HStack{
                        Button(action:{
                            camisas = true
                        }){
                            VStack(spacing: 3){
                                Text("Camisas")
                                    .font(.system(size: 20))
                                    .padding(.bottom, 10)
                                Image("Camisas")
                                    .resizable()
                                    .frame(width: 170, height: 170)
                                    
                            }.padding(.leading, 30)
                        }
                        
                        Button(action:{
                            interior = true
                        }){
                            VStack(spacing: 3){
                                Text("Ropa interior")
                                    .font(.system(size: 20))
                                    .padding(.top, 20)
                                Image("Ropa interior")
                                    .resizable()
                                    .frame(width: 170, height: 170)
                                    .padding(.all)
                            }.padding(.trailing)
                        }
                    }
                    
                    HStack{
                        Button(action:{
                            trajes = true
                        }){
                            VStack(spacing: 3){
                                Text("Trajes")
                                    .font(.system(size: 20))
                                Image("Trajes")
                                    .resizable()
                                    .frame(width: 170, height: 170)
                                    
                            }
                        }
                        
                        Button(action:{
                            jerseys = true
                        }){
                            VStack(spacing: 3){
                                Text("Jerseys")
                                    .font(.system(size: 20))
                                Image("Jerseys")
                                    .resizable()
                                    .frame(width: 170, height: 170)
                            }
                        }
                    }
                    
                    HStack{
                        Spacer(minLength: 50)
                        Button(action:{
                            banio = true
                        }){
                            VStack(spacing: 3){
                                Text("Ropa de baño")
                                    .font(.system(size: 20))
                                    
                                Image("Ropa de baño")
                                    .resizable()
                                    .frame(width: 170, height: 170)
                                    
                            }.padding(.bottom, 35)
                            .padding(.leading, 85)
                        }
                        
                        Button(action:{
                            pijamas = true
                        }){
                            VStack(spacing: 3){
                                Text("Pijamas")
                                    .font(.system(size: 20))
                                    .padding(.top, 25)
                                Image("Pijamas")
                                    .resizable()
                                    .frame(width: 170, height: 170)
                                    .padding(.all, 25)
                                    .padding(.bottom, 20)
                                    
                            }.padding(.trailing, 65)
                        }
                        
                        Spacer(minLength: 50)
                    }
                    
                    HStack{
                        Button(action:{
                            faldas = true
                        }){
                            VStack(spacing: 3){
                                Text("Faldas")
                                    .font(.system(size: 20))
                                Image("Faldas")
                                    .resizable()
                                    .frame(width: 170, height: 170)
                                    .padding(.top)
                            }
                        }
                        
                        Button(action:{
                            vestidos = true
                        }){
                            VStack(spacing: 3){
                                Text("Vestidos")
                                    .font(.system(size: 20))
                                Image("Vestidos")
                                    .resizable()
                                    .frame(width: 170, height: 170)
                            }
                        }
                    }.padding(.bottom)
                }.foregroundColor(.black)
                
                ZStack{
                    ZStack{
                        NavigationLink("", destination: TiposRopaView(tipo: "Pantalones"), isActive: $pantalones)
                        NavigationLink("", destination: TiposRopaView(tipo: "Camisetas"), isActive: $camisetas)
                        NavigationLink("", destination: TiposRopaView(tipo: "Sudaderas"), isActive: $sudaderas)
                        NavigationLink("", destination: TiposRopaView(tipo: "Chaquetas"), isActive: $chaquetas)
                        NavigationLink("", destination: TiposRopaView(tipo: "Camisas"), isActive: $camisas)
                        NavigationLink("", destination: TiposRopaView(tipo: "Ropa interior"), isActive: $interior)
                        NavigationLink("", destination: TiposRopaView(tipo: "Trajes"), isActive: $trajes)
                    }
                    
                    NavigationLink("", destination: TiposRopaView(tipo: "Jerseys"), isActive: $jerseys)
                    NavigationLink("", destination: TiposRopaView(tipo: "Ropa de baño"), isActive: $banio)
                    NavigationLink("", destination: TiposRopaView(tipo: "Pijamas"), isActive: $pijamas)
                    NavigationLink("", destination: TiposRopaView(tipo: "Faldas"), isActive: $faldas)
                    NavigationLink("", destination: TiposRopaView(tipo: "Vestidos"), isActive: $vestidos)
                }
            }
        }.navigationTitle("Ropa")
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text("Ropa").font(.headline).foregroundColor(Color.white)
                }
            }
        }
    }
}


/**ScrollView {
    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2), spacing: 10){
        ForEach(prendas.prendas, id: \.self.id){ prenda in
            PrendaCardView(prenda: prenda)
        }
    }
}.padding(.trailing)*/
