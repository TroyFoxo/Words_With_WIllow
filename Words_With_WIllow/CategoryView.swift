//
//  CategoryView.swift
//  Words_With_WIllow
//
//  Created by Alumno on 11/03/25.
//

import Foundation
import SwiftUI

struct CategoryView: View {
    
    @State private var isActive = false // State to control the navigation

    
    var body: some View {
        
            
        ZStack
        {
            //Color.black
            //Color.cyan.opacity(0.35)
            
            
            
            
            
            VStack {
                
                //Lenguajes
                HStack{
                    Image(systemName: "globe").resizable().frame(width: 30, height: 30)
                    Text("Languages")
                }.modifier(CategoryModifier())
                
                //ds
                
                //Lenguajes
                HStack{
                    Image(systemName: "globe").resizable().frame(width: 30, height: 30)
                    Text("Languages")
                }.modifier(CategoryModifier())
                
                
                
              
                
                
                // Button that triggers the navigation to the third view
                Button(action: {
                    isActive = true // Set isActive to true to trigger the navigation
                }) {
                    Text("Category View")
                }.modifier(RoundButtonModifier(backgroundColor: .green))
                    .padding(.top)

                
                
                // NavigationLink that is triggered programmatically to go to ThirdView
                NavigationLink(
                    destination: WordView(),
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
    CategoryView()
}
