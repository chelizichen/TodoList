//
//  ContentView.swift
//  TodoList
//
//  Created by 彭城 on 2022/6/7.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack{
            Text("Leemulus TodoList!")
                .font(.title3)
                .fontWeight(.light)
                .padding(.top, 10.0)
                .frame(width: 300.0, height: 30.0)
            ListToDo()
//            TodoDoneList()
            Text("GitHub:chelizichen")
                .font(.body)
                .foregroundColor(Color.gray)
                .padding(.bottom, 10.0)
                .frame(width: 300.0, height: 30.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListToDo:View{
    @State var todolist:[String] = []
    @State var doneList:[String] = []
    @State var text:String = ""
    
    func addList(todo:String)->Void{
        if todo.isEmpty{
            return
        }else{
            let newTodo = String(todolist.count+1)+" "+todo
            todolist.append(newTodo)
            return
        }
    }
    
    //        TodoDoneList.addDone(todo: todolist[index])
    
    
    func handleDone(index:Int){
//        print(index)
        doneList.append(todolist[index])
        todolist.remove(at: index)
        print(doneList)
        print(todolist)
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
                    addList(todo:text)
                    text = ""
                }).frame(width: 300.0, height: 30.0,alignment: .bottom)
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
                }
            }else{
                Text("暂时没有数据").frame(width: 300, height: 100, alignment: .bottom    )
            }
        }
    }
}

//struct TodoDoneList:View{
//    static var done:[String] = ["测试数据"]
//    static func addDone(todo:String)->Void{
//        print(done)
//        done.append(todo)
//    }
//    var body: some View{
//        if TodoDoneList.done.count != 0{
//            List{
//                ForEach(TodoDoneList.done.indices,id:\.self){
//                    index in Text(TodoDoneList.done[index])
//                }
//            }
//        }else{
//            Text("There Is No TodoItem Done")
//        }
//    }
//}
