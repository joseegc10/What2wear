//
//  ConjuntoView.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 4/6/21.
//

import SwiftUI

struct ConjuntoView: View {
    @State var conjunto: ConjuntoModel
    @State var prendas: [PrendaModel]
    
    @State private var elige = false
    @State private var comparte = false
    @StateObject var imageLoader: DocumentViewModel = DocumentViewModel(documentURL: "")
    @State var dirImagenes = [String]()
    
    @StateObject var prendasViewModel = PrendaViewModel()
    
    @State private var inicio = false
    
    @State private var mensajeFin = false
    
    @State private var imageData : Data = .init(capacity: 0)
    @State private var mostrarMenu = false
    @State private var imagePicker = false
    @State private var source : UIImagePickerController.SourceType = .camera
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            NavigationLink("", destination: InitView(), isActive: $inicio)
            
            ScrollView {
                Spacer()
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2), spacing: 10){
                    ForEach(prendas, id: \.self.id){ prenda in
                        PrendaCardView(prenda: prenda)
                    }
                }
            }.padding(.trailing)
            
            VStack{
                Spacer()
                
                HStack {
                    Button(action: {
                        prendasViewModel.deleteConjunto(id: conjunto.id, dirImagen: conjunto.dirImagen)
                        mensajeFin = true
                        inicio = true
                    }, label: {
                        Image(systemName: "trash")
                            .font(.system(size: 25))
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.white)
                    })
                    .background(Color("navBar"))
                    .cornerRadius(30)
                    .padding()
                    .shadow(color: Color.black.opacity(0.3),
                            radius: 3,
                            x: 3,
                            y: 3)
                    .padding(.leading, 20)
                    .alert(isPresented: $mensajeFin) {
                        Alert(title: Text("Conjunto eliminado correctamente"), message: Text(""), dismissButton: .default(Text("Ok")))
                    }
                    
                    Spacer()
                    
                    Button(action:{
                        mostrarMenu.toggle()
                    }){
                        Image(systemName: "camera")
                            .font(.system(size: 25))
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.white)
                    }.actionSheet(isPresented: $mostrarMenu, content: {
                        ActionSheet(title: Text("Menu"), message: Text("Selecciona una opción"), buttons: [
                            .default(Text("Cámara"), action: {
                                source = .camera
                                imagePicker.toggle()
                            }),
                            .default(Text("Librería"), action: {
                                source = .photoLibrary
                                imagePicker.toggle()
                            }),
                            .default(Text("Cancelar"))
                        ])
                    }).sheet(isPresented: $imagePicker) {
                        ImagePicker(show: $imagePicker, image: $imageData, source: source, guardaDirectamenteConjunto: true, conjunto: conjunto)
                    }.background(Color("navBar"))
                    .cornerRadius(30)
                    .padding()
                    .shadow(color: Color.black.opacity(0.3),
                            radius: 3,
                            x: 3,
                            y: 3)
                    
                    Spacer()
                    
                    
                    Button(action: {
                        comparte.toggle()
                    }, label: {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 25))
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.white)
                    })
                    .background(Color("navBar"))
                    .cornerRadius(30)
                    .padding()
                    .shadow(color: Color.black.opacity(0.3),
                            radius: 3,
                            x: 3,
                            y: 3)
                    .padding(.trailing, 20)
                    .sheet(isPresented: $comparte, content: {
                        ShareSheet(items: prendasViewModel.imagenes)
                    })
                }
            }.onAppear{
                for prenda in prendas{
                    dirImagenes.append(prenda.dirImagen)
                }
                
                prendasViewModel.getImagenes(dirImagenes: dirImagenes)
            }
        }.navigationTitle("Prendas de " + conjunto.nombre)
    }
}
