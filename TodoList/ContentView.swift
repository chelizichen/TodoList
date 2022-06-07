//
//  ContentView.swift
//  TodoList
//
//  Created by 彭城 on 2022/6/7.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Leemulus TodoList!")
            .font(.title3)
            .fontWeight(.light)
            .padding()
            .frame(width: 200.0, height: 100.0)
        
        Text("This is My MacOs App").bold()
        ListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListView:View{
    var body: some View{
        Text("GitHub:chelizichen")
            .font(.body)
            .foregroundColor(Color.gray)
            .padding(.bottom, 20.0)
            .frame(width: 200.0, height: 30.0)
    }
}
