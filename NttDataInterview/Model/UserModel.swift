//
//  UserModel.swift
//  NttDataInterview
//
//  Created by Juan Antonio Ayala Sánchez on 13/02/25.
//

import Foundation


struct UserModel : Codable, Identifiable{
    
    var id : Int
    var name : String
    var username : String
    var email : String
    var address : AddressModel
    var phone : String
    var website : String
    var company : CompanyModel
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case username
        case email
        case address
        case phone
        case website
        case company
    }
    ///Este init se realiza ya que el campo phone, contiene una cadena extra despues del numero
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.username = try container.decode(String.self, forKey: .username)
        self.email = try container.decode(String.self, forKey: .email)
        self.address = try container.decode(AddressModel.self, forKey: .address)
        self.phone = try container.decode(String.self, forKey: .phone).components(separatedBy: " ")[0]
        self.website = try container.decode(String.self, forKey: .website)
        self.company = try container.decode(CompanyModel.self, forKey: .company)
    }
}

struct CompanyModel : Codable{
    var name : String
    var catchPhrase : String
    var bs : String
}
struct AddressModel : Codable{
    var street : String
    var city : String
    var zipCode : String
    var suite : String
    
    enum CodingKeys: String, CodingKey {
        case street = "street"
        case city
        case zipCode = "zipcode"
        case suite
    }
    ///Este init es necesario ya que el campo zipCode viene en el json todo en minusculas
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.street = try container.decode(String.self, forKey: .street)
        self.city = try container.decode(String.self, forKey: .city)
        self.zipCode = try container.decode(String.self, forKey: .zipCode)
        self.suite = try container.decode(String.self, forKey: .suite)
    }
}
