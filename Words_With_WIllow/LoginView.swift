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
                Color.black
                Color.cyan.opacity(0.35)
                
                VStack {
                    
                    TextField("EMAIL", text: .constant(""))
                    {}.modifier(RoundButtonModifier(backgroundColor: .white))
                    
                    TextField("PASSWORD",text: .constant(""))
                    {}.modifier(RoundButtonModifier(backgroundColor: .green))
                    

                    //Navegacion
                    // Button that triggers the navigation
                    Button(action: {
                        isActive = true // Set isActive to true to trigger the navigation
                    }) {
                        Text("Go to Second View")
                    }.modifier(RoundButtonModifier(backgroundColor: .green))

                    // NavigationLink that is triggered programmatically
                    NavigationLink(
                        destination: IntroView(),
                        isActive: $isActive // Binding to the state variable
                    ) {
                        EmptyView() // Empty view since the navigation is triggered programmatically
                    }
                        
                }.padding()
                
                
                
                
            }.ignoresSafeArea(.all)
            
            
        }
        
    }
    
}

#Preview {
    LoginView()
}
