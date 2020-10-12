//
//  Detail.swift
//  Steam UI
//
//  Created by Mahesh Prasad on 12/10/20.
//

import SwiftUI

struct Detail: View {
    
    @State var selected = "About"
    
    var body: some View {
        VStack(spacing: 0) {
            Image("Header")
                .edgesIgnoringSafeArea(.top)
            ZStack{
                
                VStack(spacing: 20) {
                    HStack(spacing: 25) {
                        Button(action: {
                            self.selected = "About"
                        }, label: {
                            Text("About").padding(.vertical, 15).padding(.horizontal, 22)
                        }).background(self.selected == "About" ? Color("Color") :
                                        Color.clear)
                        .foregroundColor(self.selected == "About" ? .white : Color.gray)
                        .cornerRadius(15)
                        
                        Button(action: {
                            self.selected = "Media"
                        }, label: {
                            Text("Media").padding(.vertical, 15).padding(.horizontal, 22)
                        }).background(self.selected == "Media" ? Color("Color") :
                                        Color.clear)
                        .foregroundColor(self.selected == "Media" ? .white : Color.gray)
                        .cornerRadius(15)
                    }.padding(.top, 15)
                    
                    if self.selected == "About" {
                    
                    About()
                    } else {
                        Media()
                    }
                }
                
            }.background(Rounded().fill(Color.black))
            .padding(.top, -15)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct Rounded: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 25, height: 25))
        return Path(path.cgPath)
    }
}


struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail()
    }
}

struct About: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Welcome to San Francisco, the birthplace of the technological revolution. Play as young Marcus, a brilliant hacker, and join DedSec, the most celebrated hacker group. Your goal: the largest hacking operation in history.").padding(.vertical, 15)
            
            HStack{
                Spacer()
                
                Button(action: {}, label: {
                    Text("More About This Game >")
                })
            }
            
            Text("System Requirements").padding(.vertical, 15)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                HStack(spacing: 10) {
                    Image("min")
                    Text("Minimum Requirements")
                }
            })
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                HStack(spacing: 10) {
                    Image("max")
                    Text("Maximum Requirements")
                }
            }).padding(.top, 15)
            
            Spacer()
            
        }.padding(.horizontal, 25)
        .foregroundColor(Color.white.opacity(0.6))
    }
}

struct Media: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Images")
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(detail, id: \.self) { i in
                        Image(i)
                    }
                }
            }.padding(.top, 15)
            
            Text("Video")
            
            ZStack {
                Image("d3")
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "play.circle.fill").font(.largeTitle)
                }).foregroundColor(.white)
            }.padding(.top, 15)
            
            Spacer()
        }.padding(.horizontal, 25)
        .foregroundColor(Color.white.opacity(0.6))
    }
}
