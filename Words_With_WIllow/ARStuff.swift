//
//  ARStuff.swift
//  categoriesProject
//
//  Created by Raymond Chavez on 26/03/25.
//

import SwiftUI
import RealityKit
import ARKit

// La vista principal
struct ARStuff: View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

// El "adaptador" que usaremos para ver el contenido AR
struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        // Descomenta la sig. linea para ver los puntos de geometria, planos detectados, etc.
        arView.debugOptions = [.showFeaturePoints, .showAnchorOrigins, .showAnchorGeometry]
        
        // Habilitar la configuracion para detectar los planos horizontales
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        arView.session.run(config) // Aqui iniciamos la sesion de AR
        
        // Al picarle al plano horizontal, corre la accion (en este caso, poner el modelo)
        let tapGestureRecognizer = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(_:)))
        arView.addGestureRecognizer(tapGestureRecognizer)
        
        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
}

// Coordina el modelo y sus caracteristicas (ubicacion, taps, etc.)
class Coordinator: NSObject {
    
    // Manejar el toque de pantalla y poner el modelo en el plano
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let arView = gestureRecognizer.view as? ARView else { return }

        // Conseguir la ubicacion de donde se hizo el "tap" en el plano y lo regresa
        let location = gestureRecognizer.location(in: arView)
        // Hacer un check para ver si el tap topa con un plano detectado
        let hitTestResults = arView.hitTest(location, types: [.existingPlaneUsingExtent])
        
        // Si se detecta un plano, pone el modelo en esa ubicacion
        if let hitTestResult = hitTestResults.first {
            loadModel(at: hitTestResult.worldTransform, arView: arView)
        }
    }
    
    // Carga y coloca el modelo en el plano en la sesion de AR
    func loadModel(at transform: simd_float4x4, arView: ARView) {
        
        // NOTA: Aqui poner el nombre del modelo que usas (sin el .usdz) y recuerda ponerlo (el modelo usdz) en la carpeta root del proyecto
        
        guard let modelEntity = try? Entity.loadModel(named: "glazed") else {
            print("Error, model wasn´t loaded correctly.")
            return
        }
        
        // Determina un anchor de la posicion para que se quede siempre en esa posicion
        let anchor = AnchorEntity(world: transform)
        anchor.addChild(modelEntity)
        // Confirma el anchor a la sesion de AR
        arView.scene.anchors.append(anchor)
    }
}

