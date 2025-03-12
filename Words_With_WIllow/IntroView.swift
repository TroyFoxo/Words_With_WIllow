//
//  IntroView.swift
//  Words_With_WIllow
//
//  Created by Alumno on 11/03/25.
//

import Foundation


import SwiftUI

struct IntroView: View {
    
    @State private var isActive = false // State to control the navigation

    
    var body: some View {
        
        
            
            ZStack
            {
                Color.black
                Color.cyan.opacity(0.35)
                
                
                VStack {
                    
                    
                    // Button that triggers the navigation to the third view
                                Button(action: {
                                    isActive = true // Set isActive to true to trigger the navigation
                                }) {
                                    Text("Intro View")
                                        
                                }.modifier(RoundButtonModifier(backgroundColor: .green))

                                // NavigationLink that is triggered programmatically to go to ThirdView
                                NavigationLink(
                                    destination: CategoryView(),
                                    isActive: $isActive // Binding to the state variable
                                ) {
                                    EmptyView() // Empty view since the navigation is triggered programmatically
                                }
                    
                    
                    
                        
                    
                }
                
                .padding()
                
                
                
                
            }.ignoresSafeArea(.all)
            
        }
        
        
        
    
}

#Preview {
    IntroView()
}
