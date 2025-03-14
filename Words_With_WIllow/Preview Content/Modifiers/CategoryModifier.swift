//
//  CategoryModifier.swift
//  Words_With_WIllow
//
//  Created by Alumno on 13/03/25.
//

import Foundation
import SwiftUI

struct CategoryModifier: ViewModifier {
    
    
    //Variables de entrada

    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(Color.white)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(Color.green.opacity(0.6))
            .clipShape(Capsule())
    }
}

#Preview {
    CategoryView()
}
