//
//  ContentView.swift
//  Lab1_Jorrel_Tigbayan
//
//  Created by Jorrel Tigbayan on 2025-02-13.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numberOutput: Int = 0
    @State private var userCorrect = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}













struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
