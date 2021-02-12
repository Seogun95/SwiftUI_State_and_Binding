//
//  ContentView.swift
//  SwiftUI_State_and_Binding
//
//  Created by 김선중 on 2021/02/12.
//

import SwiftUI


let play = musicPlay()

struct ContentView: View {

    @State var index = 0
    
    private var backgroundColors = [
        Color.red,
        Color.yellow,
        Color.blue,
        Color.green,
        Color.white
    ]
    
    var body: some View {
        ZStack {
            VStack{
                Spacer()
                
                musicPlay()
                    .padding(40)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(backgroundColors[index])
            .onTapGesture {
                withAnimation {
                    if(self.index == self.backgroundColors.count-1){
                        self.index = 0
                    }else {
                        self.index += 1
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
