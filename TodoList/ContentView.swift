//
//  ContentView.swift
//  TodoList
//
//  Created by 彭城 on 2022/6/7.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Leemulus TodoList!")
                .font(.title3)
                .fontWeight(.light)
                .padding(.top, 10.0)
                .frame(width: 300.0, height: 30.0)
            ListToDo()
            Text("GitHub:chelizichen")
                .font(.body)
                .foregroundColor(Color.gray)
                .padding(.bottom, 10.0)
                .frame(width: 300.0, height: 30.0)
        }
    }
}

struct ListToDo:View{
    @State var todolist:[String] = []
    @State var doneList:[String] = []
    @State var text:String = ""
    func addList(todo:String,indices:String)->Void{
        if todo.isEmpty{
            return
        }else{
            let newTodo = indices+" "+todo
            todolist.append(newTodo)
            return
        }
    }
    func handleDone(index:Int){
        doneList.append(todolist[index])
        todolist.remove(at: index)
    }
    
    var body: some View{
        ZStack{
            List{
                ForEach(todolist.indices,id:\.self){
                    index in Text(todolist[index])
                        .font(.title2).fontWeight(.bold)
                        .foregroundColor(Color.blue)
                        .multilineTextAlignment(.center)
                        .lineLimit(4).onTapGesture {
                            handleDone(index: index)
                        }
                }
            }.frame(width: 300, height: 300, alignment:.top)
            
            TextField("请输入TodoItem",text:$text,onCommit:{
                    addList(todo:text,indices: String(todolist.count+1))
                    text = ""
                }).frame(width: 300.0, height: 100.0,alignment: .center)
            
            if doneList.count > 0{
                Form{
                    ForEach(doneList.indices,id:\.self){
                        index in Text(doneList[index])
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.blue)
                            .multilineTextAlignment(.center)
                            .lineLimit(4)
                    }
                }.frame(width: 300, height: 300, alignment: .bottom)
            }else{
                Text("暂时没有数据").frame(width: 300, height: 300, alignment: .bottom    )
            }
        }
    }
}
