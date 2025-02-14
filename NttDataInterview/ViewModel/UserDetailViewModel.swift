//
//  UserDetailViewModel.swift
//  NttDataInterview
//
//  Created by Juan Antonio Ayala Sánchez on 13/02/25.
//

import SwiftUI

class UserDetailViewModel : ObservableObject{
    
    func openMap(lat: String, lng: String){
        print("\(lat)    \(lng)")
        let url = URL(string: "maps://?q=\(lat),\(lng)")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            print("No se puede abrir Apple Maps")
        }
    }
    
    func openPhone(phone: String){
        let cleanPhone = phone.replacingOccurrences(of: "-", with: "").replacingOccurrences(of: ".", with: "")
        if let url = URL(string: "tel://\(cleanPhone)") {
            UIApplication.shared.open(url)
        }else {
            print("No se puede abrir el telefono en Apple ")
        }
    }
    
    func openEmail(email: String){
        if let url = URL(string: "mailto:\(email)") {
            UIApplication.shared.open(url)
        }else {
            print("No se puede abrir mail en Apple")
        }
    }
}
