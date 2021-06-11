//
//  FileCardView.swift
//  FileChange
//
//  Created by Jose Alberto Garcia Collado on 5/5/21.
//

import SwiftUI
import Firebase

struct PrendaCardView: View {
    var prenda: PrendaModel
    @State private var estoyEdit = false
    @State private var infoPrenda = false
    
    @State private var elige = false
    @State private var comparte = false
    
    @State private var items = [Any]()
        
    @StateObject var imageLoader: DocumentViewModel = DocumentViewModel(documentURL: "")
    
    var body: some View {
        VStack (alignment: .center){
            ImagenStorageView(imageURL: prenda.dirImagen, anchura: 130, nombreAlternativa: "prenda")
            
            Spacer()
            
            HStack(spacing: 20){
                Spacer()
                
                Button(action: {
                    infoPrenda = true
                }){
                    Image(systemName: "info.circle")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding(.leading, 40)
                }.sheet(isPresented: $infoPrenda, content: {
                    PrendaView(prenda: prenda)
                })
                
                Spacer()
                
                Button(action: {
                    items.removeAll()
                    imageLoader.documentURL = prenda.dirImagen
                    imageLoader.load { res in
                        if res {
                            items.append(imageLoader.data.flatMap(UIImage.init)!)
                            items.append(prenda.descripcion)
                            comparte.toggle()
                        }
                    }
                }){
                    Image(systemName: "square.and.arrow.up")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding(.trailing, 70)
                }.sheet(isPresented: $comparte, content: {
                    ShareSheet(items: items)
                })
            }
            
            NavigationLink("", destination: AddEditPrendaView(prenda: prenda, editar: true), isActive: $estoyEdit)
        }.padding(.leading)
        .onTapGesture {
            estoyEdit.toggle()
        }
    }
}

import LinkPresentation


