//
//  ContentView.swift
//  TodoList
//
//  Created by 彭城 on 2022/6/7.
//

import SwiftUI


struct ContentView: View {
    func hello(str:String) -> Void {
        print("hello",str)
        num += 1
    }
    func show() -> Void {
        bool = true
        listItem.append("asd")
    }
    
    var date:String = "TuesDay"
    @State private var num = 1
    @State private var bool = false
    @State private var listItem = ["tom","cat"]
//    @State private var len = Self.init().listItem.count
    var body: some View {
        VStack{
            Text("Leemulus TodoList!"+date)
                .font(.title3)
                .fontWeight(.light)
                .padding()
                .frame(width: 300.0, height: 100.0)
            
//            Text(String(num)+". This is My MacOs App").fontWeight(.regular).bold().frame(width: 200, height: 50, alignment: .center)
//
//            Form{
//                ForEach(0..<listItem.count){
//                    number in Text(listItem[number])
//                }
//            }
//
//            if bool{
//                Button("添加"+String(num)) {
//                    hello(str: date)
//                }
//            }
//
//            Button("点击显示") {
//                show()
//
//            }
            
//            ListView().body
            AView()
//            Text("GitHub:chelizichen")
//                .font(.body)
//                .foregroundColor(Color.gray)
//                .padding(.bottom, 20.0)
//                .frame(width: 200.0, height: 30.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ListView:View{
    @State public var list:[String] = ["Tom","Jerry"]
    func appendItem()->[Text]{
        var TextList:[Text] = []
        for key in list{
            TextList.append(Text(key))
        }
        return TextList
    }
    var body: some View{
        VStack{
            Form {
                ForEach(0 ..< appendItem().count) { number in
                    appendItem()[number]
               }
            }
        }
    }
}

struct AView:View{
    @State var foo = ["a","b","c"]
    var body: some View{
        ZStack{
            List{
                ForEach(foo.indices,id:\.self){
                    index in Text(foo[index])
                }
            }
            Button("ADD"){
                foo.append("d")
            }
        }
    }
}

