//
//  ContentView.swift
//  CoinFlip Watch App
//
//  Created by Ziemowit Korzeniewski on 12/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State var result : Bool
    var body: some View {
        
        NavigationView{
            
            ZStack{
                
                LinearGradient(colors: [.black, .gray.opacity(0.45)], startPoint: .top, endPoint: .bottomTrailing).ignoresSafeArea().frame(width: 200, height: 200)
                VStack {
                    Image("MainChar")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .opacity(0.8)
                    
                    Text("To be or not to be")
                        .font(.system(size: 12, weight: .thin, design: .monospaced))
                    Button(action: { self.result = Flip()}
                           , label: {
                        NavigationLink(destination: Flipped(result: result, blur_on: true))
                        {
                            Text("Flip").accentColor(.white)
                        }
                        .font(.system(size: 15, weight: .thin))
                            .frame(width: 80, height: 20)
                            .buttonBorderShape(.roundedRectangle(radius: 20))
                    }).buttonStyle(.plain)
                        .frame(width: 150, height: 50)
                }
            }
            .padding()
        }}
    
    func Flip() -> Bool
    {
        let result = Int.random(in: 0...1)
        if result == 0
        {
            return false
        }
        else
        {
            return true
        }
       
    }
}

#Preview {
    ContentView(result: true)
}
