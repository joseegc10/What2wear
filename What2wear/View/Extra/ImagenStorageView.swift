//
//  ImagenStorageView.swift
//  FileChange
//
//  Created by Jose Alberto Garcia Collado on 5/5/21.
//

import SwiftUI

struct ImagenStorageView: View {
    @StateObject var imageLoader: DocumentViewModel = DocumentViewModel(documentURL: "")
    let imageURL: String
    let anchura: CGFloat
    let nombreAlternativa: String
    @State var imagenAlternativa = UIImage()
    
    var body: some View {
        if imageURL != "" {
            VStack(alignment: .leading){
                Image(uiImage: imageLoader.data.flatMap(UIImage.init) ?? imagenAlternativa)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: anchura)
                    .onAppear{
                        imageLoader.documentURL = imageURL
                        imageLoader.load { _ in
                            
                        }
                    }
            }.onAppear{
                imagenAlternativa = UIImage(named: nombreAlternativa)!
            }
        } else {
            Image(uiImage: imagenAlternativa)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: anchura)
                .onAppear{
                    imagenAlternativa = UIImage(named: nombreAlternativa)!
                }
        }
    }
}
