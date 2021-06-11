//
//  ConjuntoModel.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 2/6/21.
//

import Foundation

struct ConjuntoModel: Identifiable, Hashable {
    var id = ""
    var nombre = ""
    var prendas = [String]()
    var dirImagen = ""
}
