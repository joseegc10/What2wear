//
//  AddPrendaView.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 2/6/21.
//

import SwiftUI
import Firebase

struct AddEditPrendaView: View {
    @State var prenda = PrendaModel()
    let tiposPosibles: [String] = TipoPrenda.allCases.map{ $0.rawValue }
    @State private var tipoElegido: [String:Bool] = [:]
    
    @StateObject var prendas = PrendaViewModel()

    var editar: Bool
    
    @State private var elegirCapacidad = false
    
    @State private var alerta = false
    @State private var mensajeFin = false
        
    @State private var imageData : Data = .init(capacity: 0)
    @State private var mostrarMenu = false
    @State private var imagePicker = false
    @State private var source : UIImagePickerController.SourceType = .camera
    
    @State private var fileName = ""
    @State private var elegirFile = false
        
    @State private var borrado = false
    
    @State var tipoRopa = ""
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            ScrollView{
                // Formulario
                VStack(spacing: 10){
                    VStack{
                        Spacer()
                        
                        ZStack {
                            HStack {
                                if alerta {
                                    Spacer()
                                    ProgressView()
                                        .padding(.bottom, 30)
                                        .padding(.trailing, 30)
                                }
                            }
                            
                            
                            Button(action:{
                                mostrarMenu.toggle()
                            }){
                                if imageData.count != 0 {
                                    Image(uiImage: UIImage(data: imageData)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 150)
                                } else {
                                    ImagenStorageView(imageURL: prenda.dirImagen, anchura: 220, nombreAlternativa: "prenda")
                                }
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
                                ImagePicker(show: $imagePicker, image: $imageData, source: source)
                            }
                        }
                    }
                    
                    VStack(alignment:.leading, spacing: 10){
                        VStack(alignment:.leading, spacing: 10) {
                            Text("Descripción")
                                .bold()
                                .font(.body)
                                .foregroundColor(.black)
                            
                            TextEditor(text: $prenda.descripcion)
                                .frame(height:100, alignment: .center)
                                .cornerRadius(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color("navBar"), lineWidth: 2)
                                )
                                .lineSpacing(10)
                                .disableAutocorrection(true)
                        }
                    }.padding(.horizontal)
                    
                    Spacer()
                    
                    TiposPickerView(selectedTitle: $prenda.tipoPrenda, tipoInicial: prenda.tipoPrenda, tipoRopa: $prenda.tipoRopa)
                    
                    Spacer()
                }
            }.onTapGesture {
                self.hideKeyboard()
            }
            
            VStack {
                HStack {
                    if editar {
                        Button(action: {
                            alerta = true
                            prendas.deletePrenda(prenda: prenda){ (fin) in
                                if fin {
                                    alerta = false
                                    borrado = true
                                }
                            }
                        }, label: {
                            Image(systemName: "trash")
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
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        alerta = true
                        
                        if !editar {
                            prenda.id = UUID().uuidString
                            prenda.idCreador = idUser
                            
                            prendas.addPrenda(prenda: prenda, imagen: imageData){ (fin) in
                                if fin {
                                    alerta = false
                                    prenda = PrendaModel()
                                    imageData = .init(capacity: 0)
                                    mensajeFin = true
                                }
                            }
                        } else {
                            if imageData.count != 0 {
                                prendas.editPrendaWithImage(prenda: prenda, imagen: imageData) { (fin) in
                                    if fin {
                                        alerta = false
                                        imageData = .init(capacity: 0)
                                        mensajeFin = true
                                    }
                                }
                            } else {
                                prendas.editPrenda(prenda: prenda) { (fin) in
                                    if fin {
                                        alerta = false
                                        imageData = .init(capacity: 0)
                                        mensajeFin = true
                                    }
                                }
                            }
                        }
                    }, label: {
                        if editar {
                            Image(systemName: "pencil")
                                .font(.system(size: 30))
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color.white)
                        } else {
                            Image(systemName: "plus")
                                .font(.system(size: 25))
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color.white)
                        }
                    })
                    .background(Color("navBar"))
                    .cornerRadius(30)
                    .padding()
                    .shadow(color: Color.black.opacity(0.3),
                            radius: 3,
                            x: 3,
                            y: 3)
                    .disabled(prenda.descripcion == "" || (!editar && imageData.count == 0))
                }
                
                Spacer()
            }
        }.navigationBarTitle("Añadir prenda", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    if editar {
                        Text("Editar").font(.headline).foregroundColor(Color.white)
                    } else {
                        Text("Añadir").font(.headline).foregroundColor(Color.white)
                    }
                }
            }
        }
    }
}

