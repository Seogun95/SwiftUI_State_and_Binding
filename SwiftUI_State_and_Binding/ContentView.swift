

import SwiftUI


let play = musicPlay()

struct ContentView: View {

    @State var index = 0
    
    private var backgroundColors = [
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
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                    if(self.index == self.backgroundColors.count-1){
                        self.index = 0
                    }else {
                        self.index += 1
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
