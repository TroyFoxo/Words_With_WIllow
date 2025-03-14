//
//  Category2View.swift
//  Words_With_WIllow
//
//  Created by Alumno on 13/03/25.
//


import SwiftUI

struct Category2View: View {
    // Lista de categorías con iconos de SF Symbols
    @State private var categorias = [
        ("globe", "Languages!"),
        ("dog", "Animals!"),
        ("swift", "Programing!"),
        ("pencil", "Artsy stuff!")
    ]
    
    // Lista de selección de categorías
    @State private var seleccionadas = Set<String>()
    
    // Nombre de la clave en UserDefaults
    private let categoriasKey = "categoriasSeleccionadas"
    
    var body: some View {
        NavigationView {
            VStack {
                // Título en la parte superior
                Text("Select your categories!!!")
                    .font(.title)
                    .padding()
                
                // Lista de categorías con checkboxes y SF Symbols
                List(categorias, id: \.1) { categoria in
                    HStack {
                        // Símbolo de SF Symbol a la izquierda
                        Image(systemName: categoria.0) // Usamos el nombre del símbolo
                            .foregroundColor(.orange) // Color del ícono, puedes cambiarlo
                            .padding(.trailing, 10) // Ajustamos la separación con el texto
                        
                        // Título de la categoría
                        Text(categoria.1)
                            .font(.body)
                        
                        Spacer()
                        
                        // Checkbox para marcar la categoría
                        Image(systemName: self.seleccionadas.contains(categoria.1) ? "checkmark.square.fill" : "square")
                            .onTapGesture {
                                if self.seleccionadas.contains(categoria.1) {
                                    self.seleccionadas.remove(categoria.1)
                                } else {
                                    self.seleccionadas.insert(categoria.1)
                                }
                                self.saveSelections() // Guardamos las selecciones
                            }
                    }
                    .padding()
                }
                
                // Botón para continuar
                Button(action: {
                    // Acción para continuar, por ejemplo navegar a otra vista
                    print("Continuar con las categorías seleccionadas: \(self.seleccionadas)")
                }) {
                    Text("Continuar")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationBarHidden(true) // Ocultar barra de navegación si no la necesitas
            .onAppear {
                // Cargar las selecciones cuando la vista aparezca
                self.loadSelections()
            }
        }
    }
    
    // Función para guardar las selecciones en UserDefaults
    private func saveSelections() {
        // Guardamos el Set en UserDefaults
        UserDefaults.standard.set(Array(seleccionadas), forKey: categoriasKey)
    }
    
    // Función para cargar las selecciones desde UserDefaults
    private func loadSelections() {
        // Cargamos las selecciones desde UserDefaults (si existen)
        if let savedSelections = UserDefaults.standard.array(forKey: categoriasKey) as? [String] {
            seleccionadas = Set(savedSelections)
        }
    }
}

#Preview {
    
    Category2View()
    
}
