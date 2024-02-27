//
//  ContentView.swift
//  To-Do-App
//
//  Created by StudentAM on 2/27/24.
//

import SwiftUI

struct ContentView: View {
    @State private var num: Int = 0
    @State private var text: String = ""
    var body: some View {
        VStack
        {
            Text("To-Do List")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("Number of items on list:\(num)")
            TextField("enter your task here.", text: $text)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle()) // Optional: Applies a rounded border
        }
        HStack
        {
            Button (action: addItems, label: {Text("Button") })
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            Button (action: delItems, label: {Text("Button") })
                .padding()
                .background(.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
    func addItems ()
    {
        if text == ""
        {
            
        }
    }

    func delItems()
    {
        
    }

    #Preview {
        ContentView()
    }

}
