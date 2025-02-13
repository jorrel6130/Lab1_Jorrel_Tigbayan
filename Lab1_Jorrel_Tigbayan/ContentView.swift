//
//  ContentView.swift
//  Lab1_Jorrel_Tigbayan
//
//  Created by Jorrel Tigbayan on 2025-02-13.
//

import SwiftUI

struct ContentView: View {
    
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    @State private var numberOutput: Int = 0
    @State private var rightAnswers: Int = 0
    @State private var wrongAnswers: Int = 0
    
    var body: some View {
        VStack {
            Text("\(numberOutput)")
                .onReceive(timer) { time in
                self.numberOutput = Int.randomNumber1To100
            }
                .font(.system(size: 50))
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
        }
        .padding()
    }
}

extension Int {
    static var randomNumber1To100: Int {
        return Int.random(in: 1..<101)
    }
}











struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
