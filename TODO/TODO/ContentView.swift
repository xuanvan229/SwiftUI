//
//  ContentView.swift
//  TODO
//
//  Created by Van Hong Xuan on 18/02/2023.
//

import SwiftUI

struct TodoItem: Identifiable, Equatable {
    let id = UUID()
    var title : String
    var isCompleted: Bool = false
}

struct ContentView: View {
    
    
    @State var todoItems: [TodoItem] = [
        TodoItem(title: "Mua sữa"),
        TodoItem(title: "Giao báo cáo"),
        TodoItem(title: "Đi bơi")
    ]
    
    @State var newItemTitle: String = ""
    @State var showingAlert: Bool = false

    
    var body: some View {
        
        NavigationView {
            VStack {
                VStack {
                    TextField("Nhập tiêu đề mới", text: $newItemTitle)
                        .padding(.horizontal, 10)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding()
            
            
            List(todoItems) { item in
                HStack {
                    Text(item.title).strikethrough(item.isCompleted).foregroundColor(item.isCompleted ? .white : .primary)
                    Spacer()
                    Toggle(isOn: $todoItems[todoItems.firstIndex(of: item)!].isCompleted){}
                }
                .listRowBackground(item.isCompleted ? Color.teal : Color.white)
            }
            .navigationTitle("Todo List")
            .toolbar {
                Button(action: {
                        if newItemTitle.isEmpty {
                            showingAlert = true
                        } else {
                            let newTodoItem = TodoItem(title: newItemTitle)
                            todoItems.append(newTodoItem)
                            newItemTitle = ""
                        }
                    }, label: {
                        Image(systemName: "plus")
                    })
                    .disabled(newItemTitle.isEmpty)
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Lỗi"), message: Text("Bạn cần nhập tiêu đề cho Todo item."), dismissButton: .default(Text("Đồng ý")))
            }
            .onAppear {
                UITableView.appearance().backgroundColor = .clear
            }
            .background(Color.red.opacity(0.1))
            .cornerRadius(10)
            .padding(.horizontal, 10)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
