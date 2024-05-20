//
//  SwiftSVG.swift
//  Practica_DesarrolloSeguro_J.Bueno
//
//  Created by Jose Bueno Cruz on 20/5/24.
//

import SwiftUI
import SwiftSVG

struct SVGView: UIViewRepresentable {
    let urlString: String
    
    func makeUIView(context: Context) -> UIView {
        let svgView = UIView()
        
        // Cargar el SVG desde la URL
        if let url = URL(string: urlString) {
            let svgLayer = SVGLayer(layer: url)
            svgLayer.frame = svgView.bounds
            svgLayer.fillColor = nil
            svgView.layer.addSublayer(svgLayer)
        }
        
        return svgView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // No es necesario actualizar la vista en este ejemplo simple
    }
}
