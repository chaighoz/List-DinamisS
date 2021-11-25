//
//  itemModel.swift
//  List Dinamis
//
//  Created by Irianda on 09/01/21.
//

import Foundation
import Combine

class ItemModel: ObservableObject {
    @Published var newTitle : String = ""
    @Published var items : [Item] = []
    
    func onAdd(title: String) {
        items.append(Item(title: title))
        self.newTitle = ""
    }
    
    func onDelete(offSet : IndexSet){
        items.remove(atOffsets: offSet)
    }
    
    func onMove(source: IndexSet, destination: Int){
        items.move(fromOffsets: source, toOffset: destination)
    }
    
    func onUpdate(index : Int,title: String){
        items[index].title = title
    }
}
