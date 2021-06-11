//
//  AccountView.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 2/6/21.
//

import SwiftUI

struct AccountView: View {
    @StateObject var prendas = PrendaViewModel()
    @EnvironmentObject var estado: FirebaseAuth
    
    @State private var imageData : Data = .init(capacity: 0)
    @State private var mostrarMenu = false
    @State private var imagePicker = false
    @State private var source : UIImagePickerController.SourceType = .camera
    
    var body: some View {
        HStack(spacing: 40) {
            Button(action:{
                mostrarMenu.toggle()
            }){
                if imageData.count != 0 {
                    Image(uiImage: UIImage(data: imageData)!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                } else {
                    ImagenStorageView(imageURL: prendas.user.dirImagen, anchura: 100, nombreAlternativa: "user")
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
                ImagePicker(show: $imagePicker, image: $imageData, source: source, guardaDirectamente: true, user: prendas.user)
            }

            
            VStack(spacing: 10){
                Text(prendas.user.nombre + " " + prendas.user.apellidos)
                
                Text(prendas.user.correo)
                
                Button(action:{
                    UserDefaults.standard.removeObject(forKey: "logueado")
                    estado.estado = .login
                }){
                    Text("Cerrar sesion")
                        .foregroundColor(Color.red)
                }
            }.foregroundColor(.white)
        }.frame(maxWidth: .infinity, alignment: .center)
        .padding(.vertical)
        .background(Color("navBar"))
        .modifier(CardModifier())
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color("navBar"), lineWidth: 0)
        )
        .padding(.all, 10)
        .onAppear{
            //prendas.getUserInfo()
        }
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
    }
}
