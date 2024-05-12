//
//  Flipped.swift
//  CoinFlip Watch App
//
//  Created by Ziemowit Korzeniewski on 12/05/2024.
//

import SwiftUI
import Combine

struct Flipped: View {
    @State var result : Bool
    @State public var radius : Double = 3.0
    @State var blur_on : Bool
    @State var original_blur = false
    var body: some View {
        ZStack
        {
            LinearGradient(colors: [.black, .gray.opacity(0.45)], startPoint: .top, endPoint: .bottomTrailing).ignoresSafeArea().frame(width: 200, height: 200)
                .task{
                   
                }
            
           
            
            VStack
            {
                
                VStack{
                    
                    if result == true
                    {
                        VStack{
                            Text("Heads").font(.system(size: 12, weight: .thin))
                            Image("Heads_app").resizable().frame(width: 134, height: 134,alignment: .top)
                            
                        }
                    }
                    else
                    {
                        VStack{
                            Text("Tails").font(.system(size: 12, weight: .thin))
                            Image("Tails_app").resizable().frame(width: 134, height: 134)
                            
                        }
                    }}
                Button(action: {result = Flip()}, label: {
                    Text("Flip again")
                }).frame(width: 120, height: 30)
                    .buttonBorderShape(.roundedRectangle(radius: 25))
                Spacer()
            }.onReceive(Just(blur_on)) { newValue in
                // Zapisz oryginalną wartość, jeśli nie została jeszcze zapisana
                if self.original_blur {
                    self.original_blur = self.blur_on
                }
                
                // Ustaw opóźnienie na przywrócenie poprzedniego stanu po 1.5 sekundy
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.blur_on = self.original_blur
                }
                if blur_on == false
                {
                    radius = 0.0
                }
                else
                {
                    radius = 7.0
                }}
        }.blur(radius: radius)
       
    }
    func Flip() -> Bool
    {
        blur_on.toggle()
        
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
//    func changeBlur()
//    {
//        self.radius = 0.0
//
//    }
}

#Preview {
    Flipped(result: true, blur_on: true)
}
