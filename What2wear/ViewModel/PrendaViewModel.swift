//
//  PrendaViewModel.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 2/6/21.
//

import Foundation
import Firebase

class PrendaViewModel: ObservableObject {
    @Published var user = UserModel()
    @Published var prendas = [PrendaModel]()
    @Published var conjuntos = [ConjuntoModel]()
    @Published var prendasConjunto = [String:[PrendaModel]]()
    @Published var imagenes = [Data]()
    @Published var tiposRopa = [String]()
    
    /// Añadir la información del usuario a firebase
    /// - Parameter user: Usuario a añadir
    /**func addUserInfo(user: UserModel){
        let db = Firestore.firestore()

        let campos: [String:Any] = ["nombre": user.nombre, "apellidos":user.apellidos, "correo":user.correo]
        db.collection("usuarios").document(idUser).setData(campos){error in
            if let e = error?.localizedDescription {
                print("Error al guardar información del usuario", e)
            } else {
                print("Guardado correctamente")
            }
        }
    }
    
    func docEnUser(valor: [String:Any], id: String) -> UserModel{
        let nombre = valor["nombre"] as? String ?? ""
        let apellidos = valor["apellidos"] as? String ?? ""
        let correo = valor["correo"] as? String ?? ""
        let dirImagen = valor["dirImagen"] as? String ?? ""
        
        let user = UserModel(id: id, nombre: nombre, apellidos: apellidos,
                             correo: correo, dirImagen: dirImagen)
        
        return user
    }
    
    func getUserInfo() {
        let db = Firestore.firestore()
        
        db.collection("usuarios").document(idUser).getDocument { (doc, error) in
            if let doc = doc, doc.exists {
                let datos = doc.data()
                self.user = self.docEnUser(valor: datos!, id: doc.documentID)
            } else {
                print("Error al obtener información del usuario")
            }
        }
    }*/
    
    /// Añadir una prenda a firebase
    /// - Parameter prenda: Prenda a subir
    func addPrenda(prenda: PrendaModel, imagen: Data, completion: @escaping (Bool) -> Void){
        let storage = Storage.storage().reference()
        let nombrePortada = UUID()
        let directorioImagen = storage.child("imagenes/\(nombrePortada)")
        let metadataPortada = StorageMetadata()
        metadataPortada.contentType = "image/png"
        
        directorioImagen.putData(imagen, metadata: metadataPortada){data, error in
            if error == nil {
                print("guardo la imagen")
                
                let db = Firestore.firestore()
                let id = UUID().uuidString

                let campos: [String:Any] = ["descripcion": prenda.descripcion, "dirImagen":String(describing: directorioImagen), "tipoPrenda":prenda.tipoPrenda, "idCreador":idUser, "tipoRopa":prenda.tipoRopa]
                db.collection("prendas").document(id).setData(campos){error in
                    if let e = error?.localizedDescription {
                        print("Error al crear prenda", e)
                    } else {
                        print("Prenda creada correctamente")
                        db.collection("tiposRopa").document(idUser).getDocument { doc, err in
                            if let doc = doc, doc.exists {
                                let datos = doc.data()
                                var tiposRopa = datos?["tiposRopa"] as? [String] ?? []
                                
                                if prenda.tipoPrenda == "Ropa" && !tiposRopa.contains(prenda.tipoRopa){
                                    tiposRopa.append(prenda.tipoRopa)
                                    
                                    let campos: [String:Any] = ["tiposRopa": tiposRopa]
                                    db.collection("tiposRopa").document(idUser).updateData(campos){ (error) in
                                        if let error = error?.localizedDescription {
                                            print("Error al editar tipos de ropa", error)
                                        } else {
                                            print("Edito correctamente los tipos de ropa")
                                            completion(true)
                                        }
                                    }
                                }
                                
                                completion(true)
                            } else {
                                let campos: [String:Any] = ["tiposRopa": [prenda.tipoRopa]]
                                db.collection("tiposRopa").document(idUser).setData(campos){ (error) in
                                    if let error = error?.localizedDescription {
                                        print("Error al crear tipos de ropa", error)
                                    } else {
                                        print("Creo correctamente los tipos de ropa")
                                        completion(true)
                                    }
                                }
                            }
                        }
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
    
    func getTiposRopa(completion: @escaping (Bool) -> Void){
        let db = Firestore.firestore()
        
        db.collection("tiposRopa").document(idUser).getDocument { (doc, error) in
            if let doc = doc, doc.exists {
                let datos = doc.data()
                let tipos = datos?["tiposRopa"] as? [String] ?? []
                self.tiposRopa = tipos
                completion(true)
            } else {
                print("Error al obtener tipos de ropa")
                completion(false)
            }
        }
    }
    
    func docEnPrenda(document: QueryDocumentSnapshot) -> PrendaModel{
        let valor = document.data()
        let descripcion = valor["descripcion"] as? String ?? ""
        let dirImagen = valor["dirImagen"] as? String ?? ""
        let tipoPrenda = valor["tipoPrenda"] as? String ?? ""
        let tipoRopa = valor["tipoRopa"] as? String ?? ""
        let idCreador = valor["idCreador"] as? String ?? ""

        let prenda = PrendaModel(id: document.documentID, descripcion: descripcion, tipoPrenda: tipoPrenda, tipoRopa: tipoRopa, dirImagen: dirImagen, idCreador: idCreador)
        
        return prenda
    }
    
    func docEnPrenda(valor: [String:Any], id: String) -> PrendaModel{
        let descripcion = valor["descripcion"] as? String ?? ""
        let dirImagen = valor["dirImagen"] as? String ?? ""
        let tipoPrenda = valor["tipoPrenda"] as? String ?? ""
        let tipoRopa = valor["tipoRopa"] as? String ?? ""
        let idCreador = valor["idCreador"] as? String ?? ""

        let prenda = PrendaModel(id: id, descripcion: descripcion, tipoPrenda: tipoPrenda, tipoRopa: tipoRopa, dirImagen: dirImagen, idCreador: idCreador)
        
        return prenda
    }
    
    func editPrenda(prenda: PrendaModel, completion: @escaping (Bool) -> Void){
        let db = Firestore.firestore()
        let campos: [String:Any] = ["descripcion": prenda.descripcion, "tipoPrenda":prenda.tipoPrenda, "tipoRopa":prenda.tipoRopa]
        db.collection("prendas").document(prenda.id).updateData(campos){ (error) in
            if let error = error?.localizedDescription {
                print("Error al editar prenda", error)
            } else {
                print("Edito correctamente la prenda")
                completion(true)
            }
        }
    }
    
    func editPrendaWithImage(prenda: PrendaModel, imagen: Data, completion: @escaping (Bool) -> Void){
        let storageImage = Storage.storage().reference(forURL: prenda.dirImagen)
        storageImage.delete(completion: nil)
        
        let storage = Storage.storage().reference()
        let nombrePortada = UUID()
        let directorioImagen = storage.child("imagenes/\(nombrePortada)")
        let metadataPortada = StorageMetadata()
        metadataPortada.contentType = "image/png"
        
        directorioImagen.putData(imagen, metadata: metadataPortada){data, error in
            if error == nil {
                print("guardo la imagen")
                // Guardamos primero la imagen y ahora el texto ya que la imagen tarda mas
                let db = Firestore.firestore()
                let campos: [String:Any] = ["descripcion": prenda.descripcion, "tipoPrenda":prenda.tipoPrenda, "tipoRopa":prenda.tipoRopa, "dirImagen":String(describing: directorioImagen)]

                db.collection("prendas").document(prenda.id).updateData(campos){ (error) in
                    if let error = error?.localizedDescription {
                        print("Error al editar prenda", error)
                    } else {
                        print("Edito correctamente la prenda")
                        completion(true)
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
    
    func deletePrenda(prenda: PrendaModel, completion: @escaping (Bool) -> Void){
        let db = Firestore.firestore()
        db.collection("prendas").document(prenda.id).delete()
            
        let storageImage = Storage.storage().reference(forURL: prenda.dirImagen)
        storageImage.delete(completion: nil)
        
        completion(true)
    }
    
    func busquedaPrendas(tipoBuscado: String){
        let db = Firestore.firestore()
        
        db.collection("prendas").whereField("idCreador", isEqualTo: idUser)
            .whereField("tipoPrenda", isEqualTo: tipoBuscado)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error al obtener prendas por tipo: \(err)")
                } else {
                    self.prendas.removeAll()
                    for document in querySnapshot!.documents {
                        let nuevaPrenda = self.docEnPrenda(document: document)
                        
                        self.prendas.append(nuevaPrenda)
                    }
                }
        }
    }
    
    func busquedaPrendasRopa(tipoBuscado: String){
        let db = Firestore.firestore()
        
        db.collection("prendas").whereField("idCreador", isEqualTo: idUser)
            .whereField("tipoPrenda", isEqualTo: "Ropa")
            .whereField("tipoRopa", isEqualTo: tipoBuscado)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error al obtener prendas por tipo: \(err)")
                } else {
                    self.prendas.removeAll()
                    for document in querySnapshot!.documents {
                        let nuevaPrenda = self.docEnPrenda(document: document)
                        
                        self.prendas.append(nuevaPrenda)
                    }
                }
        }
    }
    
    func addConjunto(prendasConjunto: [PrendaModel], nombre: String){
        let db = Firestore.firestore()
        let id = UUID().uuidString
        
        var listaIds = [String]()
        
        for prenda in prendasConjunto {
            listaIds.append(prenda.id)
        }

        let campos: [String:Any] = ["nombre": nombre, "prendas": listaIds, "idCreador": idUser]
        db.collection("conjuntos").document(id).setData(campos){error in
            if let e = error?.localizedDescription {
                print("Error al crear conjunto", e)
            } else {
                print("Conjunto creado correctamente")
            }
        }
    }
    
    func docEnConjunto(valor: [String:Any], id: String) -> ConjuntoModel{
        let nombre = valor["nombre"] as? String ?? ""
        let prendas = valor["prendas"] as? [String] ?? []
        let dirImagen = valor["dirImagen"] as? String ?? ""

        let conjunto = ConjuntoModel(id: id, nombre: nombre, prendas: prendas, dirImagen: dirImagen)
        
        return conjunto
    }
    
    func getConjuntos(){
        let db = Firestore.firestore()
        
        db.collection("conjuntos").whereField("idCreador", isEqualTo: idUser).getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error al obtener conjuntos: \(err)")
                } else {
                    self.conjuntos.removeAll()
                    
                    for document in querySnapshot!.documents {
                        let nuevoConjunto = self.docEnConjunto(valor: document.data(), id: document.documentID)

                        self.conjuntos.append(nuevoConjunto)
                    }
                }
        }
    }
    
    func getPrendasConjunto(id: String) {
        let db = Firestore.firestore()
        
        db.collection("conjuntos").document(id).getDocument { (doc, error) in
            if let doc = doc, doc.exists {
                let datos = doc.data()
                let conjunto = self.docEnConjunto(valor: datos!, id: doc.documentID)
                
                if self.prendasConjunto[conjunto.id] == nil {
                    self.prendasConjunto[conjunto.id] = []
                }
                
                self.prendasConjunto[conjunto.id]!.removeAll()
                
                for idPrenda in conjunto.prendas {
                    let docPrenda = db.collection("prendas").document(idPrenda)

                    docPrenda.getDocument { [self] (document2, error2) in
                        if let document2 = document2, document2.exists {
                            let datos = document2.data()
                            let nuevaPrenda = docEnPrenda(valor: datos!, id: document2.documentID)
                            
                            self.prendasConjunto[conjunto.id]!.append(nuevaPrenda)
                        } else {
                            print("Error al obtener prendas del conjunto")
                        }
                    }
                }
            } else {
                print("Error al obtener conjunto")
            }
        }
    }
    
    func busquedaConjuntos(nombreBuscado: String){
        let db = Firestore.firestore()
        
        db.collection("conjuntos").whereField("idCreador", isEqualTo: idUser).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error al obtener conjuntos: \(err)")
            } else {
                self.conjuntos.removeAll()
                
                for document in querySnapshot!.documents {
                    let nuevoConjunto = self.docEnConjunto(valor: document.data(), id: document.documentID)

                    if nombreBuscado == "" || nuevoConjunto.nombre.lowercased().contains(nombreBuscado.lowercased()){
                        self.conjuntos.append(nuevoConjunto)
                    }
                }
            }
        }
    }
    
    func editConjuntoImage(conjunto: ConjuntoModel, imagen: Data, completion: @escaping (Bool) -> Void){
        if conjunto.dirImagen != "" {
            let storageImage = Storage.storage().reference(forURL: conjunto.dirImagen)
            storageImage.delete(completion: nil)
        }
        
        let storage = Storage.storage().reference()
        let nombrePortada = UUID()
        let directorioImagen = storage.child("imagenes/\(nombrePortada)")
        let metadataPortada = StorageMetadata()
        metadataPortada.contentType = "image/png"
        
        directorioImagen.putData(imagen, metadata: metadataPortada){data, error in
            if error == nil {
                print("guardo la imagen")
                // Guardamos primero la imagen y ahora el texto ya que la imagen tarda mas
                let db = Firestore.firestore()
                let campos: [String:Any] = ["dirImagen":String(describing: directorioImagen)]

                db.collection("conjuntos").document(conjunto.id).updateData(campos){ (error) in
                    if let error = error?.localizedDescription {
                        print("Error al editar conjunto", error)
                    } else {
                        print("Edito correctamente el conjunto")
                        completion(true)
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
    
    func getImagenes(dirImagenes: [String]){
        for dir in dirImagenes {
            let storageImage = Storage.storage().reference(forURL: dir)
            storageImage.getData(maxSize: 1024 * 1024 * 1024) { (data, error) in
                if let error = error?.localizedDescription {
                    print("error al obtener el documento", error)
                }else{
                    print("documento obtenido correctamente")
                    self.imagenes.append(data!)
                }
            }
        }
    }
    
    func deleteConjunto(id: String, dirImagen: String){
        let db = Firestore.firestore()
        db.collection("conjuntos").document(id).delete()
        
        if dirImagen != "" {
            let storageImage = Storage.storage().reference(forURL: dirImagen)
            storageImage.delete(completion: nil)
        }
    }
}
