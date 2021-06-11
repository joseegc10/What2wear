//
//  PrendaModel.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 2/6/21.
//

import Foundation

enum TipoPrenda: String, CaseIterable {
    case ropa = "Ropa"
    case calzado = "Calzado"
    case complementos = "Complementos"
}

enum TipoRopa: String, CaseIterable {
    case pantalones = "Pantalones"
    case camisetas = "Camisetas"
    case sudaderas = "Sudaderas"
    case chaquetas = "Chaquetas"
    case camisas = "Camisas"
    case interior = "Ropa interior"
    case trajes = "Trajes"
    case jerseys = "Jerseys"
    case banio = "Ropa de baño"
    case pijamas = "Pijamas"
    case faldas = "Faldas"
    case vestidos = "Vestidos"
}

struct PrendaModel: Identifiable, Hashable {
    var id: String = ""
    var descripcion: String = ""
    var tipoPrenda: String = "Ropa"
    var tipoRopa: String = ""
    var dirImagen: String = ""
    var idCreador: String = ""
}
