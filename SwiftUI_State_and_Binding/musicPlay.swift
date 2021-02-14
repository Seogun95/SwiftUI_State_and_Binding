import SwiftUI

struct Episode {
    let song: String
    let singer: String
    let track: String
}


struct musicPlay: View {
    
    let episode = Episode(song: "Dynamite", singer: "BTS", track: "DayTime Version")
   
   @State var isPlaying = false
    
    var body: some View {
        
            VStack {
                Text(self.episode.song)
                    .font(.title)
                    //isPlaying이 재생중이면 blue 아니면 white
                    .foregroundColor(self.isPlaying ? .blue : .white)
                
                Text(self.episode.track)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                Text(self.episode.singer)
                
                playButton(isPlaying: $isPlaying)
                
            }
            //버튼을 눌렀을때 적용시켜줄 삼항연산자 코드 추가
            .padding(isPlaying ? 100 : 30)
            .background(self.isPlaying ? Color.yellow : Color.blue)
            .cornerRadius(self.isPlaying ? 60 : 10)
    }
}

struct musicPlay_Previews: PreviewProvider {
    static var previews: some View {
        musicPlay()
    }
}
//플레이버튼 생성
struct playButton: View {
    
    //isPlaying 바인딩
    @Binding var isPlaying: Bool
    
    var body: some View {
        Button(action: {
            //애니메이션과 함께
            withAnimation{
                self.isPlaying.toggle()
            }
        }) {
            //재생중이면 일시정지 버튼
            if(self.isPlaying) {
                Image(systemName: "pause.fill")
                    .foregroundColor(Color.blue)
            //재생중이지 않으면 재생버튼 생성
            } else {
                Image(systemName: "play.fill")
                    .foregroundColor(Color.black)
            }
        }
        .font(.system(size: 30))
        .padding(12)
    }
}



