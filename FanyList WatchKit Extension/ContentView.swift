//
//  ContentView.swift
//  FanyList WatchKit Extension
//
//  Created by Xiaoheng Pan on 3/11/21.
//

import SwiftUI

struct Person: Identifiable {
    var id = UUID()
    var name: String
    var age: Int
}

struct ContentView: View {
    
    @State var people = [
        Person(name: "Xiao", age: 12),
        Person(name: "Dave", age: 15),
        Person(name: "Qing", age: 20),
        Person(name: "Check", age: 21),
        Person(name: "Gusto", age: 31),
        Person(name: "Domino", age: 42)
    ]
    
    @State var selectedPerson: String?
    
    var body: some View {
        List {
            ForEach(people, id: \.id) { person in
                VStack(alignment: .leading, spacing: nil, content: {
                    Button(action: {
                        if selectedPerson == person.id.uuidString {
                            selectedPerson = nil
                        } else {
                            selectedPerson = person.id.uuidString
                        }
                    }, label: {
                        Text(person.name)
                    })
                    if selectedPerson == person.id.uuidString {
                        Text("Age: \(person.age)")
                    }
                }).padding().listRowPlatterColor(self.selectedPerson == person.id.uuidString ? Color.init(white: 0.3) : Color.init(white: 0.1)).animation(.easeInOut(duration: 0.2))
            }.onMove(perform: move).onDelete(perform: delete)
        }
    }
    
    func delete(at offsets: IndexSet) {
        people.remove(atOffsets: offsets)
    }
    
    func move(fromOffsets source: IndexSet, toOffsets destination: Int) {
        people.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
