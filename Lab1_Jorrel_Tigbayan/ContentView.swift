//
//  ContentView.swift
//  Lab1_Jorrel_Tigbayan
//
//  Created by Jorrel Tigbayan on 2025-02-13.
//

import SwiftUI

struct ContentView: View {
    
    @State var timer = Timer.publish(every: 5, on: .main, in: .common)
        .autoconnect()
        .prepend(.now)
    
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
                .padding()
            Button(action: {
                if (isPrime(numberOutput) == true) {
                    rightAnswers += 1
                } else {
                    wrongAnswers += 1
                }
                timer = Timer.publish(every: 5, on: .main, in: .common)
                    .autoconnect()
                    .prepend(.now)
            }, label: {
                Text("Prime")
            })
                .padding()
            Button(action: {
                if (isPrime(numberOutput) == false) {
                    rightAnswers += 1
                } else {
                    wrongAnswers += 1
                }
                timer = Timer.publish(every: 5, on: .main, in: .common)
                    .autoconnect()
                    .prepend(.now)
            }, label: {
                Text("Not Prime")
            })
                .padding()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .padding()
        }
        .padding()
    }
    
    func isPrime(_ number: Int) -> Bool {
        if number <= 1 {
            return false
        }

        if number <= 3 {
            return true
        }

        var i = 2

        while i * i <= number {
            if number % i == 0 {
                return false
            }

            i += 1
        }

        return true;
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
