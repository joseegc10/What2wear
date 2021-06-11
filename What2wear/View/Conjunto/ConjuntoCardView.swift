//
//  ConjuntoCardView.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 3/6/21.
//

import SwiftUI

struct ConjuntoCardView: View {
    @State var conjunto: ConjuntoModel
    @StateObject var prendas = PrendaViewModel()
    let tam: Int
    @State private var verConjunto = false
        
    var body: some View {
        VStack {
            
            if conjunto.dirImagen == "" {
                HStack {
                    if Array(prendas.prendasConjunto.keys).contains(conjunto.id) && prendas.prendasConjunto[conjunto.id]!.count > 0{
                        ImagenStorageView(imageURL: prendas.prendasConjunto[conjunto.id]?[0].dirImagen ?? "", anchura: CGFloat(tam), nombreAlternativa: "prenda")
                    } else {
                        Image("blanca")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: CGFloat(tam))
                    }
                    
                    Spacer()
                    
                    if Array(prendas.prendasConjunto.keys).contains(conjunto.id) && prendas.prendasConjunto[conjunto.id]!.count > 1 {
                        ImagenStorageView(imageURL: prendas.prendasConjunto[conjunto.id]![1].dirImagen, anchura: CGFloat(tam), nombreAlternativa: "prenda")
                    } else {
                        Image("blanca")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: CGFloat(tam))
                    }
                }
                
                Spacer()
                
                HStack {
                    if Array(prendas.prendasConjunto.keys).contains(conjunto.id) && prendas.prendasConjunto[conjunto.id]!.count > 2 {
                        ImagenStorageView(imageURL: prendas.prendasConjunto[conjunto.id]![2].dirImagen, anchura: CGFloat(tam), nombreAlternativa: "prenda")
                    } else {
                        Image("blanca")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: CGFloat(tam))
                    }
                    
                    Spacer()
                    
                    if Array(prendas.prendasConjunto.keys).contains(conjunto.id) && prendas.prendasConjunto[conjunto.id]!.count > 3 {
                        ImagenStorageView(imageURL: prendas.prendasConjunto[conjunto.id]![3].dirImagen, anchura: CGFloat(tam), nombreAlternativa: "prenda")
                    } else {
                        Image("blanca")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: CGFloat(tam))
                    }
                }
            } else {
                ImagenStorageView(imageURL: conjunto.dirImagen, anchura: CGFloat(tam*2), nombreAlternativa: "conjunto")
            }
            
            Spacer()
            
            HStack{
                Spacer()
                Text(conjunto.nombre)
                Spacer()
            }
            
            NavigationLink("", destination: ConjuntoView(conjunto: conjunto, prendas: prendas.prendasConjunto[conjunto.id] ?? []), isActive: $verConjunto)
        }.padding(.horizontal)
        .onAppear{
            prendas.getPrendasConjunto(id: conjunto.id)
        }
        .onTapGesture {
            verConjunto = true
        }
    }
}
