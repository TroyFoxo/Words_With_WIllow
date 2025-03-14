//
//  LoginView.swift
//  Words_With_WIllow
//
//  Created by Alumno on 06/03/25.
//

import Foundation


import SwiftUI

struct LoginView: View {
    
    @State private var isActive = false // State to control the navigation
    
    var body: some View {
        
        
        NavigationView
        {
            
        
            
            ZStack
        {
            //Color.black
            //Color.cyan.opacity(0.35)
            
            VStack{
                
            VStack
            {
                Text("LOGIN").font(.title).fontWeight(.bold)
            }.padding()
            
                
                VStack {
                    
                    TextField("EMAIL", text: .constant(""))
                    {}.modifier(RoundButtonModifier(backgroundColor: .black.opacity(0.1), foregroundColor: .black.opacity(0.5)))
                    
                    SecureField("PASSWORD",text: .constant(""))
                    {}.modifier(RoundButtonModifier(backgroundColor: .black.opacity(0.1), foregroundColor: .orange))
                    
                    
                    //Navegacion
                    // Button that triggers the navigation
                    Button(action: {
                        isActive = true // Set isActive to true to trigger the navigation
                    }) {
                        Text("Log in and learn!")
                    }.modifier(RoundButtonModifier(backgroundColor: .orange))
                    
                    // NavigationLink that is triggered programmatically
                    NavigationLink(
                        destination: Category2View(),
                        isActive: $isActive // Binding to the state variable
                    ) {
                        EmptyView() // Empty view since the navigation is triggered programmatically
                    }
                    
                }.padding()
                
                
                
                
            }.ignoresSafeArea(.all)
            
        }
        }
        
    }
    
}

#Preview {
    LoginView()
}
