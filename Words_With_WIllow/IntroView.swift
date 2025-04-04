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
                
                
                
                
                VStack(alignment: .center) {
                    
                    Text("Welcome to Words With Willow")
                        .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                        
                        
                    
                    Text("This is your pet!:").padding(.top)
                        
                    
                    Image(.beast).resizable().frame(height: 300).padding(.top)
                    
                    
                    Spacer()
                    
                    
                    
                    // Button that triggers the navigation to the third view
                    Button(action: {
                        isActive = true // Set isActive to true to trigger the navigation
                    }) {     Text("Intro View")   }.modifier(RoundButtonModifier(backgroundColor: .orange))

                    // NavigationLink that is triggered programmatically to go to ThirdView
                    NavigationLink(
                        destination: CategoryView(),
                        isActive: $isActive // Binding to the state variable
                    ) {
                        EmptyView()
                        // Empty view since the navigation is triggered programmatically
                    }
                    
                    
                    
                        
                    
                }
                
                .padding()
                
                
                
                
            }//.ignoresSafeArea(.all)
            
        }
        
        
        
    
}

#Preview {
    IntroView()
}
