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
    @State private var attemptCount: Int = 0
    @State private var asset: String = ""
    @State private var showAlert = false
    @State private var totalAnswers: Int = 0
    
    var body: some View {
        VStack {
            Text("\(numberOutput)")
                .onReceive(timer) { time in
                self.numberOutput = Int.randomNumber1To100
            }
                .font(.system(size: 50))
                .padding()
                .foregroundColor(.blue)
            Button(action: {
                if (isPrime(numberOutput) == true) {
                    rightAnswers += 1
                    self.asset = "check_icon"
                } else {
                    wrongAnswers += 1
                    self.asset = "cross_icon"
                }
                attemptCount += 1
                if (attemptCount == 10) {
                    showAlert = true
                    self.attemptCount = 0
                }
                timer = Timer.publish(every: 5, on: .main, in: .common)
                    .autoconnect()
                    .prepend(.now)
            }, label: {
                Text("Prime")
            })
                .font(.system(size: 50))
                .padding()
                .alert("Right answers: \(rightAnswers)\nWrong answers: \(wrongAnswers)", isPresented: $showAlert) {
                    Button("OK") {}
                }
            Button(action: {
                if (isPrime(numberOutput) == false) {
                    rightAnswers += 1
                    self.asset = "check_icon"
                } else {
                    wrongAnswers += 1
                    self.asset = "cross_icon"
                }
                attemptCount += 1
                if (attemptCount == 10) {
                    showAlert = true
                    self.attemptCount = 0
                }
                timer = Timer.publish(every: 5, on: .main, in: .common)
                    .autoconnect()
                    .prepend(.now)
            }, label: {
                Text("Not Prime")
            })
                .font(.system(size: 50))
                .padding()
                .alert("Right answers: \(rightAnswers)\nWrong answers: \(wrongAnswers)", isPresented: $showAlert) {
                    Button("OK") {}
                }
            Image(asset)
                .resizable()
                .aspectRatio(contentMode:
                        .fit)
                .frame(width: 80)
                .padding()
            VStack {
                HStack {
                    Text("\(totalAnswers)")
                        .onReceive(timer) { time in
                        self.totalAnswers = rightAnswers + wrongAnswers
                        }
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
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
