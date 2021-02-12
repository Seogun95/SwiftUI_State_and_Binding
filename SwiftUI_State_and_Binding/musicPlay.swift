//
//  musicPlay.swift
//  SwiftUI_State_and_Binding
//
//  Created by 김선중 on 2021/02/12.
//

import SwiftUI

struct musicPlay: View {
    
    let episode = Episode(song: "Dynamite", singer: "BTS", track: "DayTime Version")
    @State var isPlaying = false
    
    var body: some View {
        
            VStack {
                Text(self.episode.song)
                    .font(.title)
                    .foregroundColor(self.isPlaying ? .blue : .black)
                
                Text(self.episode.track)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                Text(self.episode.singer)
                    .foregroundColor(.secondary)
                
                playButton(isPlaying: $isPlaying)
                
            }
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
struct playButton: View {
    
    @Binding var isPlaying: Bool
    
    var body: some View {
        Button(action: {
            withAnimation{
                self.isPlaying.toggle()
            }
        }) {
            if(self.isPlaying) {
                Image(systemName: "pause.fill")
                    .foregroundColor(Color.blue)
            } else {
                Image(systemName: "play.fill")
                    .foregroundColor(Color.black)
            }
        }
        .font(.system(size: 30))
        .padding(12)
    }
}


struct Episode {
    let song: String
    let singer: String
    let track: String
}

