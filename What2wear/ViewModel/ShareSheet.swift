//
//  ShareSheet.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 3/6/21.
//

import Foundation
import SwiftUI

struct ShareSheet: UIViewControllerRepresentable {
    var items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
}
