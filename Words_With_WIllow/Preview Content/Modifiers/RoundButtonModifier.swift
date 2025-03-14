//
//  RoundButtonModifier.swift
//  Words_With_WIllow
//
//  Created by Alumno on 06/03/25.
//


//ESTO ES COMO UN ARCHIVO CSS, ES EL ESTILO QUE TOMARA CUALQUIER VIEW (boton, textbox, etc.) CUANDO SE LO ASIGNE


import Foundation
import SwiftUI

struct RoundButtonModifier: ViewModifier {
    
    
    //
    var backgroundColor: Color = .green
    var foregroundColor: Color = .white
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .multilineTextAlignment(.center)

            .foregroundColor(foregroundColor)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .clipShape(Capsule())
    }
}

#Preview {
    LoginView()
}
