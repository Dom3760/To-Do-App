import SwiftUI

struct ContentView: View {
    //private var that stores the ammount of items on list
    @State private var num: Int = 0
    //var that stores the text that is entered
    @State private var text: String = ""
    //var that stores all items on list
    @State private var items: [String] = []
    //var that determines is the alert is showing
    @State private var showingAlert = false
    
    var body: some View 
    {
        //vertical stack
        VStack
        {
            //makes a title for the page
            Text("To-Do List")
                .font(.title)
            //text that will display the current ammount of things on the list
            Text("Number of items on list: \(num)")
            //makes a text field that will link the text entered with the text variable
            TextField("Enter your task here.", text: $text)
                //adds padding and rounds the corers of the text field
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            //horizontal stack
            HStack
            {
                //button that will call add items function if pressed
                Button(action: addItems)
                {
                    // adds text to button
                    Text("Add Item")
                    // makes styling for button; adds padding, makes blue, text white, and corners rounded
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                //button that will call the delItems function if pressed; will delete all.
                Button(action: delItems)
                {
                    // text for the button
                    Text("Delete all")
                        // adds padding, gray background, white text, and rounded corners.
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            
            //makes a list so all of the list items can be displayed
            List
            {
                //uses a for each loop for each item in items array
                ForEach(items, id: \.self) { item in
                    //every time the loop runs it will display the item
                    Text(item)
                }
                // makes it so each list item can be deleted by swiping left.
                .onDelete(perform: deleteItems)
            }
            //adds padding to list
            .padding()
            
        }
        //checks if the showing Alert variable is true and if it is,
        .alert(isPresented: $showingAlert)
        {
            // it will display an alert that says to enter a valid task
            Alert(title: Text("Enter a valid task"))
        }
    }
    //function that will add items to list
    func addItems()
    {
        //if the text field is empty then it will set the alert to true
        if text == ""
        {
            showingAlert = true
        }
        //otherwise it will append the text to the array set the variable back to original, and add 1 to the count of task.
        else
        {
            items.append(text)
            text = ""
            num += 1
        }
    }
    // delItems function will remove everything from the array and then set the number of itmes in list to 0
    func delItems()
    {
        items.removeAll()
        num = 0
    }
    
    // deleteItems will accept a parameter that will inject the item on the list that will be removed
    func deleteItems(at offsets: IndexSet)
    {
        //it will then remove the injected item off the list and then subtract 1 from the number of items
        items.remove(atOffsets: offsets)
        num -= 1
    }
}
//some code that Xcode generated
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
