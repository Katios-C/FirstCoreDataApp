//
//  ContentView.swift
//  FirstCoreDataApp
//
//  Created by Екатерина Чернова on 28.01.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>
    
    
    var body: some View {
        List {
            ForEach(students, id: \.id) {student in
                Text(student.name ?? "Unknown")
                
            }
        }
        
        Button("Add") {
            let firstName = ["Ginny", "Hurry", "Luna", "Ron"]
            let lastName = ["A", "B", "C", "D"]
            
            let choosenFrstName = firstName.randomElement()!
            let choosenLastName = lastName.randomElement()!
            
            let student = Student(context: self.moc)
            student.id = UUID()
            student.name = "\(choosenFrstName)  \(choosenLastName)"
            
            try?self.moc.save()
        }
    }

   



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
}
