//
//  ContentView.swift
//  Steam UI
//
//  Created by Mahesh Prasad on 12/10/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Home().tabItem {
                Image("home")
            }
            Text("Search").tabItem {
                Image("search")
            }
            Text("Person").tabItem {
                Image("person")
            }
            Text("Menu").tabItem {
                Image("menu")
            }
        }.accentColor(.white)
        .preferredColorScheme(.dark)
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    var body: some View {
        VStack(spacing: 15) {
            HStack{
                Text("$89")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("Cart")
                })
            }.overlay(Image("Logo"))
            
            ScrollView(.vertical, showsIndicators: false) {
                topView().padding(.vertical, 15)
                middleView().padding(.vertical, 15)
                bottomView().padding(.vertical, 15)
            }
                   
        }.padding()
    }
}

struct topView: View {
    
    @State var show = false
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Featured").font(.title)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(top, id: \.self) { i in
                        Image(i).onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                            self.show.toggle()
                        })
                    }
                }
            }.padding(.top, 15)
        }.sheet(isPresented: $show) {
            Detail()
        }
    }
}

struct middleView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("New On Stream").font(.title)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 15) {
                    ForEach(middle, id:\.self){ i in
                        Image(i)
                    }
                }
            }
        }
    }
}

struct bottomView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Recommended").font(.title)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(bottom , id: \.self) { i in
                        Image(i)
                    }
                }
            }
        }
    }
    
}

// sample data.....

var top = ["Card1","Card2"]
var middle = ["m1","m2","m3"]
var bottom = ["b1","b2","b3"]
var detail = ["d1","d2"]
