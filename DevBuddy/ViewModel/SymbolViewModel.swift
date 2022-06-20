//
//  SymbolViewModel.swift
//  DevBuddy
//
//  Created by Breno Henrique on 20/06/22.
//

import Foundation
import FirebaseFirestore

class SymbolViewModel: ObservableObject
{
    @Published var groups = [SymbolGroup]()
    @Published var sf = [SymbolData]()
    
    func getGroupData()
    {
        let db = Firestore.firestore()
        
        db.collection("Groups").getDocuments
        {
            snapshot, error in
            
            if error == nil
            {
                if let snapshot = snapshot
                {
                    DispatchQueue.main.async
                    {
                        self.groups = snapshot.documents.map
                        {
                            doc in
                            return SymbolGroup(id: doc.documentID,
                                               symbol: doc["symbol"] as? String ?? "",
                                               title: doc["title"] as? String ?? "")
                        }
                    }
                }
            }
            
            else
            {
                print("ERRO")
            }
        }
        
    }
    
    func getSymbolsData(groupName: String)
    {
        let db = Firestore.firestore()
        
        db.collection(groupName).getDocuments
        {
            snapshot, error in
            
            if error == nil
            {
                if let snapshot = snapshot
                {
                    DispatchQueue.main.async
                    {
                        self.sf = snapshot.documents.map
                        {
                            doc in
                            return SymbolData(id: doc.documentID,
                                               symbol: doc["symbol"] as? String ?? "")
                        }
                    }
                }
            }
            
            else
            {
                print("ERRO")
            }
        }
        
    }
}
