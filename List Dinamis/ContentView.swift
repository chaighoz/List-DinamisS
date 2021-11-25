//
//  ContentView.swift
//  List Dinamis
//
//  Created by Irianda on 08/01/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Home()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Home : View {
    //@State var newTitle : String = ""
    @EnvironmentObject var data: ItemModel
    @State private var editMode = EditMode.inactive
    var body: some View{
        VStack{
            HStack{
                TextField("Enter Title",text: $data.newTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                addButton
            }
            .padding(.horizontal)
            
            List{
                ForEach(Array(data.items.enumerated()),id: \.offset){offset,item in
                    NavigationLink(destination: DetailView()){
                        Text(item.title)
                    }
                }
                .onDelete(perform: data.onDelete)
                .onMove(perform: data.onMove)
            }
        }
        .navigationBarTitle("List")
        .navigationBarItems(leading: EditButton())
        .environment(\.editMode, $editMode)
    }
    
    private var addButton : some View{
        switch editMode {
        case .inactive:
            return AnyView(Button(action: {}){
                HStack{
                    Image(systemName: "plus")
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(Color.white)
                .cornerRadius(7)
            })
        default:
            return AnyView(EmptyView())
        }
    }
}

struct DetailView : View  {
    var body: some View{
        Text("Detail")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


