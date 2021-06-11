var entities = [{
  "id": 1,
  "typeString": "enum",
  "cases": [
    {
  "name": "login case register case logueado case introduccion"
}
  ],
  "name": "TipoInicio"
},{
  "id": 2,
  "typeString": "class",
  "properties": [
    {
  "name": "var estado: TipoInicio",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "login(email: String, password: String, completion: @escaping (_ done: Bool) -> Void)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "register(email: String, password: String, completion: @escaping (_ done: Bool) -> Void)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "FirebaseAuth",
  "superClass": 52
},{
  "id": 3,
  "typeString": "class",
  "properties": [
    {
  "name": "var conexion : ImagePicker",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "imagePickerControllerDidCancel(_ picker: UIImagePickerController)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(conexion: ImagePicker)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    54,
    55
  ],
  "name": "Coordinator",
  "superClass": 53
},{
  "id": 4,
  "typeString": "struct",
  "properties": [
    {
  "name": "var show : Bool @Binding",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var image : Data",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var source : UIImagePickerController.SourceType",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var guardaDirectamente",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var guardaDirectamenteConjunto",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var user",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var conjunto",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "makeCoordinator() -> ImagePicker.Coordinator",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "makeUIViewController(context: Context) -> some UIImagePickerController",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "updateUIViewController(_ uiViewController: UIViewControllerType, context: Context)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ImagePicker",
  "superClass": 56,
  "containedEntities": [
    3
  ]
},{
  "id": 5,
  "typeString": "class",
  "properties": [
    {
  "name": "var data : Data?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var documentURL : String",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "load(completion: @escaping (Bool) -> Void)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(documentURL: String)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "DocumentViewModel",
  "superClass": 52
},{
  "id": 6,
  "typeString": "class",
  "properties": [
    {
  "name": "var user",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var prendas",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var conjuntos",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var prendasConjunto",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var imagenes",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var tiposRopa",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "addUserInfo(user: UserModel)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "docEnUser(valor: [String:Any], id: String) -> UserModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "getUserInfo()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "getTiposRopa(completion: @escaping (Bool) -> Void)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "addPrenda(prenda: PrendaModel, imagen: Data, completion: @escaping (Bool) -> Void)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "docEnPrenda(document: QueryDocumentSnapshot) -> PrendaModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "docEnPrenda(valor: [String:Any], id: String) -> PrendaModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "editPrenda(prenda: PrendaModel, completion: @escaping (Bool) -> Void)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "editPrendaWithImage(prenda: PrendaModel, imagen: Data, completion: @escaping (Bool) -> Void)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "deletePrenda(prenda: PrendaModel, completion: @escaping (Bool) -> Void)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "busquedaPrendas(tipoBuscado: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "busquedaPrendasRopa(tipoBuscado: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "addConjunto(prendasConjunto: [PrendaModel], nombre: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "docEnConjunto(valor: [String:Any], id: String) -> ConjuntoModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "getConjuntos()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "getPrendasConjunto(id: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "busquedaConjuntos(nombreBuscado: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "getImagenes(dirImagenes: [String])",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "deleteConjunto(id: String, dirImagen: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "editConjuntoImage(conjunto: ConjuntoModel, imagen: Data, completion: @escaping (Bool) -> Void)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "PrendaViewModel",
  "superClass": 52
},{
  "id": 7,
  "typeString": "struct",
  "properties": [
    {
  "name": "var items: [Any]",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "makeUIViewController(context: Context) -> UIActivityViewController",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "updateUIViewController(_ uiViewController: UIActivityViewController, context: Context)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ShareSheet",
  "superClass": 56
},{
  "id": 8,
  "typeString": "struct",
  "properties": [
    {
  "name": "var appDelegate",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some Scene",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let login",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "What2wearApp",
  "superClass": 57
},{
  "id": 9,
  "typeString": "enum",
  "protocols": [
    59
  ],
  "cases": [
    {
  "name": "ropa"
},
    {
  "name": "calzado"
},
    {
  "name": "complementos"
}
  ],
  "name": "TipoPrenda",
  "superClass": 58
},{
  "id": 10,
  "typeString": "enum",
  "cases": [
    {
  "name": "pantalones"
},
    {
  "name": "camisetas"
},
    {
  "name": "sudaderas"
},
    {
  "name": "chaquetas"
},
    {
  "name": "camisas"
},
    {
  "name": "interior"
},
    {
  "name": "trajes"
},
    {
  "name": "jerseys"
},
    {
  "name": "banio"
},
    {
  "name": "pijamas"
},
    {
  "name": "faldas"
},
    {
  "name": "vestidos"
}
  ],
  "name": "TipoRopa",
  "superClass": 58
},{
  "id": 11,
  "typeString": "struct",
  "properties": [
    {
  "name": "var id: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var descripcion: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var tipoPrenda: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var tipoRopa: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var dirImagen: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var idCreador: String",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    61
  ],
  "name": "PrendaModel",
  "superClass": 60
},{
  "id": 12,
  "typeString": "struct",
  "properties": [
    {
  "name": "var id",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var nombre",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var prendas",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var dirImagen",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ConjuntoModel",
  "superClass": 60
},{
  "id": 13,
  "typeString": "struct",
  "properties": [
    {
  "name": "var id: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var nombre: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var apellidos: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var correo: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var dirImagen: String",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "UserModel",
  "superClass": 60
},{
  "id": 14,
  "typeString": "struct",
  "properties": [
    {
  "name": "var email",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var password",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var login",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var estado: FirebaseAuth",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "LoginView",
  "superClass": 62
},{
  "id": 15,
  "typeString": "struct",
  "properties": [
    {
  "name": "var login: FirebaseAuth",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "IntroduccionView",
  "superClass": 62
},{
  "id": 16,
  "typeString": "struct",
  "methods": [
    {
  "name": "body(content: Content) -> some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ButtonModifier",
  "superClass": 63
},{
  "id": 20,
  "typeString": "struct",
  "properties": [
    {
  "name": "var addPrenda",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var addConjunto",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var ropa",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var complementos",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var calzado",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var conjuntos",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "init()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "InitView",
  "superClass": 62
},{
  "id": 21,
  "typeString": "struct",
  "properties": [
    {
  "name": "var email",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var password",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var nombre",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var apellidos",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var login",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var estado: FirebaseAuth @StateObject",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var usuarios",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let user",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "RegisterView",
  "superClass": 62
},{
  "id": 22,
  "typeString": "struct",
  "properties": [
    {
  "name": "var prenda: PrendaModel @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var miUrl",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var elige",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var comparte",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var items",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var imageLoader: DocumentViewModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "PrendaCardNoEditView",
  "superClass": 62
},{
  "id": 23,
  "typeString": "struct",
  "properties": [
    {
  "name": "var tipo: String @StateObject",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var prendas",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var nombre",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var isEditing",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "TypeView",
  "superClass": 62
},{
  "id": 24,
  "typeString": "struct",
  "properties": [
    {
  "name": "let id: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var title: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var selected: Bool",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "init (id: Int, title: String, selected: Bool)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    61
  ],
  "name": "Tipo"
},{
  "id": 25,
  "typeString": "struct",
  "properties": [
    {
  "name": "let tiposPosibles: [String]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var Categories: [Tipo]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var lastIndex: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var selectedTitle: String @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var currentIndex: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var ns",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var index",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let tipoInicial: String @Binding",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var tipoRopa: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "init(selectedTitle: Binding<String>, tipoInicial: String, tipoRopa: Binding<String>)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "TiposPickerView",
  "superClass": 62
},{
  "id": 26,
  "typeString": "struct",
  "properties": [
    {
  "name": "var tipo: String @StateObject",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var prendas",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "TiposRopaView",
  "superClass": 62
},{
  "id": 27,
  "typeString": "struct",
  "properties": [
    {
  "name": "var prenda",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let tiposPosibles: [String]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var tipoElegido: [String:Bool]",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var prendas",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var editar: Bool @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var elegirCapacidad",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var alerta",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var mensajeFin",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var imageData : Data",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var mostrarMenu",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var imagePicker",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var source : UIImagePickerController.SourceType",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var fileName",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var elegirFile",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var borrado",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var tipoRopa",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "AddEditPrendaView",
  "superClass": 62
},{
  "id": 28,
  "typeString": "struct",
  "properties": [
    {
  "name": "var nombre: String",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var tipo: String",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var prendas",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var isEditing",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var miPrenda",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "BuscarPrendaView",
  "superClass": 62
},{
  "id": 29,
  "typeString": "struct",
  "properties": [
    {
  "name": "var pantalones",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var camisetas",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var sudaderas",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var chaquetas",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var camisas",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var interior",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var trajes",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var jerseys",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var banio",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var pijamas",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var faldas",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var vestidos",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let tiposPosibles: [String]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var tipo: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var prendas",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var nombre",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var isEditing",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "RopaView",
  "superClass": 62
},{
  "id": 30,
  "typeString": "struct",
  "properties": [
    {
  "name": "var prenda: PrendaModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "PrendaView",
  "superClass": 62
},{
  "id": 31,
  "typeString": "struct",
  "properties": [
    {
  "name": "var prenda: PrendaModel @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var estoyEdit",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var infoPrenda",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var elige",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var comparte",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var items",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var imageLoader: DocumentViewModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "PrendaCardView",
  "superClass": 62
},{
  "id": 32,
  "typeString": "struct",
  "properties": [
    {
  "name": "var siguiente",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var anterior",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var prendas",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var selected: [String] @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var prendasConjunto: [PrendaModel] @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var elegido",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let index",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "AddCalzadoConjuntoView",
  "superClass": 62
},{
  "id": 33,
  "typeString": "struct",
  "properties": [
    {
  "name": "var prendasConjunto: [PrendaModel] @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var nombre",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var prendas",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var acaba",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "GuardaConjuntoView",
  "superClass": 62
},{
  "id": 34,
  "typeString": "struct",
  "properties": [
    {
  "name": "var nombre: String",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var prendas",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var isEditing",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "BuscarConjuntoView",
  "superClass": 62
},{
  "id": 35,
  "typeString": "struct",
  "properties": [
    {
  "name": "var conjunto: ConjuntoModel @StateObject",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var prendas",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let tam: Int @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var verConjunto",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ConjuntoCardView",
  "superClass": 62
},{
  "id": 36,
  "typeString": "struct",
  "properties": [
    {
  "name": "var parteAnterior: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var parteActual: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var parteSiguiente: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var prendas",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var selected",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var siguiente",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var anterior",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var prendasConjunto",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var dicAnterior: [String:String]",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var dic: [String:String]",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let index",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let tiposSize",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let tipos",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var i",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "AddRopaConjuntoView",
  "superClass": 62
},{
  "id": 37,
  "typeString": "struct",
  "properties": [
    {
  "name": "var conjunto: ConjuntoModel @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var prendas: [PrendaModel] @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var elige",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var comparte",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var items",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var imageLoader: DocumentViewModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var dirImagenes",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var prendasViewModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var inicio",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var mensajeFin",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var imageData : Data",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var mostrarMenu",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var imagePicker",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var source : UIImagePickerController.SourceType",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ConjuntoView",
  "superClass": 62
},{
  "id": 38,
  "typeString": "struct",
  "properties": [
    {
  "name": "var final",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var anterior",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var prendas",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var selected: [String] @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var prendasConjunto: [PrendaModel]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let index",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "AddComplementosConjuntoView",
  "superClass": 62
},{
  "id": 39,
  "typeString": "struct",
  "properties": [
    {
  "name": "var parteActual: String @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var parteSiguiente: String @StateObject",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var prendas",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var selected",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var siguiente",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var final",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var prendasConjunto",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var inicio",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var dic: [String:String]",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let index",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "AddEditConjuntoView",
  "superClass": 62
},{
  "id": 40,
  "typeString": "struct",
  "properties": [
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "SinNavView",
  "superClass": 62
},{
  "id": 41,
  "typeString": "struct",
  "properties": [
    {
  "name": "var imageLoader: DocumentViewModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let imageURL: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let anchura: CGFloat",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let nombreAlternativa: String @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var imagenAlternativa",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ImagenStorageView",
  "superClass": 62
},{
  "id": 42,
  "typeString": "struct",
  "properties": [
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "EliminaNavInitView",
  "superClass": 62
},{
  "id": 43,
  "typeString": "struct",
  "properties": [
    {
  "name": "var title: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var subTitle: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var imageName: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "UtilidadApp",
  "superClass": 62
},{
  "id": 44,
  "typeString": "struct",
  "methods": [
    {
  "name": "body(content: Content) -> some View",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(backgroundColor: UIColor, tintColor: UIColor)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "NavigationBarColor",
  "superClass": 63
},{
  "id": 46,
  "typeString": "struct",
  "properties": [
    {
  "name": "var prendas",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var estado: FirebaseAuth @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var imageData : Data",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var mostrarMenu",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var imagePicker",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var source : UIImagePickerController.SourceType",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "AccountView",
  "superClass": 62
},{
  "id": 47,
  "typeString": "struct",
  "methods": [
    {
  "name": "body(content: Content) -> some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "CardModifier",
  "superClass": 63
},{
  "id": 48,
  "typeString": "struct",
  "properties": [
    {
  "name": "var texto: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "MyNavigationView",
  "superClass": 62
},{
  "id": 49,
  "typeString": "class",
  "methods": [
    {
  "name": "application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "AppDelegate",
  "superClass": 53
},{
  "id": 50,
  "typeString": "struct",
  "properties": [
    {
  "name": "var login: FirebaseAuth",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let id",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let encodedData",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let userDefaults",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let decoded",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ContentView",
  "superClass": 62
},{
  "id": 52,
  "typeString": "class",
  "name": "ObservableObject"
},{
  "id": 53,
  "typeString": "class",
  "name": "NSObject"
},{
  "id": 54,
  "typeString": "protocol",
  "name": "UIImagePickerControllerDelegate"
},{
  "id": 55,
  "typeString": "protocol",
  "name": "UINavigationControllerDelegate"
},{
  "id": 56,
  "typeString": "class",
  "name": "UIViewControllerRepresentable"
},{
  "id": 57,
  "typeString": "class",
  "name": "App"
},{
  "id": 58,
  "typeString": "class",
  "name": "String"
},{
  "id": 59,
  "typeString": "protocol",
  "name": "CaseIterable"
},{
  "id": 60,
  "typeString": "class",
  "name": "Identifiable"
},{
  "id": 61,
  "typeString": "protocol",
  "name": "Hashable"
},{
  "id": 62,
  "typeString": "class",
  "name": "View",
  "extensions": [
    19,
    45,
    51
  ]
},{
  "id": 63,
  "typeString": "class",
  "name": "ViewModifier"
},{
  "id": 64,
  "typeString": "class",
  "name": "Text",
  "extensions": [
    17
  ]
},{
  "id": 65,
  "typeString": "class",
  "name": "Color",
  "extensions": [
    18
  ]
},{
  "id": 17,
  "typeString": "extension",
  "methods": [
    {
  "name": "customTitleText() -> Text",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "extendedEntityName": "Text"
},{
  "id": 18,
  "typeString": "extension",
  "properties": [
    {
  "name": "var mainColor",
  "type": "type",
  "accessLevel": "internal"
}
  ],
  "extendedEntityName": "Color"
},{
  "id": 19,
  "typeString": "extension",
  "methods": [
    {
  "name": "customButton() -> ModifiedContent<Self, ButtonModifier>",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "extendedEntityName": "View"
},{
  "id": 45,
  "typeString": "extension",
  "methods": [
    {
  "name": "navigationBarColor(backgroundColor: UIColor, tintColor: UIColor) -> some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "extendedEntityName": "View"
},{
  "id": 51,
  "typeString": "extension",
  "methods": [
    {
  "name": "hideKeyboard()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "extendedEntityName": "View"
}] 