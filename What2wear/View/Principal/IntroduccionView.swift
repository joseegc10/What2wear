//
//  IntroduccionView.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 2/6/21.
//

import SwiftUI

struct IntroduccionView: View {
    @EnvironmentObject var login: FirebaseAuth
    
    var body: some View {
        ScrollView {
            VStack{
                Image("conjuntos")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, alignment: .center)
                    .accessibility(hidden: true)
                
                Text("Bienvenido a")
                    .customTitleText()
                    .foregroundColor(.white)

                Text("What2wear")
                    .customTitleText()
                    .foregroundColor(.mainColor)
                
                Spacer(minLength: 50)
                
                VStack(alignment: .leading) {
                    UtilidadApp(title: "Añadir", subTitle: "Añade tus prendas de ropa y crea conjuntos con ellas", imageName: "book")
                    
                    UtilidadApp(title: "Búsquedas", subTitle: "Realiza una búsqueda de tus prendas de ropa y de tus conjuntos", imageName: "magnifyingglass")
                        .padding(.leading, 8)
                        .padding(.trailing, 30)
                }
                
                Spacer(minLength: 100)
                
                Button(action: {
                    login.estado = .logueado
                }) {
                    Text("Entrar")
                        .foregroundColor(.black)
                }.customButton()
                .padding(.horizontal)
            }
        }.padding(.top)
    }
}

// Lo de debajo basado en: https://betterprogramming.pub/creating-an-apple-like-splash-screen-in-swiftui-fdeb36b47e81

extension Text {
    func customTitleText() -> Text {
        self
            .fontWeight(.black)
            .font(.system(size: 36))
    }
}

extension Color {
    static var mainColor = Color.white
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.mainColor))
            .padding(.bottom)
    }
}

extension View {
    func customButton() -> ModifiedContent<Self, ButtonModifier> {
        return modifier(ButtonModifier())
    }
}
