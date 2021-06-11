//
//  ImagePicker.swift
//  FileChange
//
//  Created by Jose Alberto Garcia Collado on 5/5/21.
//

import Foundation
import SwiftUI
import UIKit
import Firebase

/// Obtenida con la ayuda de Internet ya que se trata de la biblioteca UIKit y tiene una estructura muy fija
struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var show : Bool
    @Binding var image : Data
    var source : UIImagePickerController.SourceType
    var guardaDirectamente = false
    var guardaDirectamenteConjunto = false
    var user = UserModel()
    var conjunto = ConjuntoModel()
    
    func makeCoordinator() -> ImagePicker.Coordinator {
        return ImagePicker.Coordinator(conexion: self)
    }
    
    func makeUIViewController(context: Context) -> some UIImagePickerController {
        let controller = UIImagePickerController()
        controller.sourceType = source
        controller.allowsEditing = true
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var conexion : ImagePicker
        
        init(conexion: ImagePicker){
            self.conexion = conexion
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            print("Se ha cancelado la seleccion de imagen")
            self.conexion.show.toggle()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            var image : UIImage!

            if let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            {
                image = img

            }
            else if let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            {
                image = img
            }

            let data = image.jpegData(compressionQuality: 0.100)
            self.conexion.image = data!
            
            if self.conexion.guardaDirectamente {
                if self.conexion.user.dirImagen != "" {
                    let storageImage = Storage.storage().reference(forURL: self.conexion.user.dirImagen)
                    storageImage.delete(completion: nil)
                }
                
                let storage = Storage.storage().reference()
                let nombrePortada = UUID()
                let directorioImagen = storage.child("imagenes/\(nombrePortada)")
                let metadataPortada = StorageMetadata()
                metadataPortada.contentType = "image/png"
                
                directorioImagen.putData(self.conexion.image, metadata: metadataPortada){data, error in
                    if error == nil {
                        print("guardo la imagen")
                        let db = Firestore.firestore()
                        let campos: [String:Any] = ["dirImagen":String(describing: directorioImagen)]
                        db.collection("usuarios").document(self.conexion.user.id).updateData(campos){ (error) in
                            if let error = error?.localizedDescription {
                                print("Error al editar usuario", error)
                            } else {
                                print("Edito correctamente el usuario")
                            }
                        }
                    } else {
                        if let error = error?.localizedDescription {
                            print("error al subir la imagen en storage", error)
                        } else {
                            print("error en la app al subir imagen")
                        }
                    }
                }
            }
            
            if self.conexion.guardaDirectamenteConjunto {
                if self.conexion.conjunto.dirImagen != "" {
                    let storageImage = Storage.storage().reference(forURL: self.conexion.conjunto.dirImagen)
                    storageImage.delete(completion: nil)
                }
                
                let storage = Storage.storage().reference()
                let nombrePortada = UUID()
                let directorioImagen = storage.child("imagenes/\(nombrePortada)")
                let metadataPortada = StorageMetadata()
                metadataPortada.contentType = "image/png"
                
                directorioImagen.putData(self.conexion.image, metadata: metadataPortada){data, error in
                    if error == nil {
                        print("guardo la imagen")
                        // Guardamos primero la imagen y ahora el texto ya que la imagen tarda mas
                        let db = Firestore.firestore()
                        let campos: [String:Any] = ["dirImagen":String(describing: directorioImagen)]

                        db.collection("conjuntos").document(self.conexion.conjunto.id).updateData(campos){ (error) in
                            if let error = error?.localizedDescription {
                                print("Error al editar conjunto", error)
                            } else {
                                print("Edito correctamente el conjunto")
                            }
                        }
                    } else {
                        if let error = error?.localizedDescription {
                            print("error al subir la imagen en storage", error)
                        } else {
                            print("error en la app al subir imagen")
                        }
                    }
                }
            }
            
            self.conexion.show.toggle()
            
            picker.dismiss(animated: true,completion: nil)
        }
        
    }
    
}

