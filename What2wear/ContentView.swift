//
//  ContentView.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 1/6/21.
//

import SwiftUI
import Firebase

var idUser = ""

struct ContentView: View {
    @EnvironmentObject var login: FirebaseAuth
    
    var body: some View {
        ZStack {
            Color("navBar").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            if login.estado == .logueado {
                InitView()
            } else if login.estado == .introduccion {
                IntroduccionView()
            } else if login.estado == .register {
                RegisterView()
            } else {
                LoginView()
            }
        }.onAppear{
            if UserDefaults.standard.object(forKey: "idUser") == nil {
                print("Creando id...")
                let id = String(UUID().uuidString)
                let encodedData = try! NSKeyedArchiver.archivedData(withRootObject: id, requiringSecureCoding: false)
                let userDefaults = UserDefaults.standard
                userDefaults.set(encodedData, forKey: "idUser")
                login.estado = .introduccion
            } else {
                login.estado = .logueado
            }
            
            let decoded = UserDefaults.standard.object(forKey: "idUser") as! Data
            idUser = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decoded) as! String
            print(idUser)
        }
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
