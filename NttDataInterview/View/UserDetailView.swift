//
//  UserDetailView.swift
//  NttDataInterview
//
//  Created by Juan Antonio Ayala Sánchez on 13/02/25.
//

import SwiftUI

struct UserDetailView: View {
    var userInfo : UserModel
    @StateObject var userListViewModel = UserDetailViewModel()
    
    var body: some View {
        ZStack{
            ///El ZStack es necesario para que las esferas en el background se queden en el fondo de la vista
            BackgroundSpheresView(positionBlue: SpherePosition.left, positionOrange: SpherePosition.none, positionPurple: SpherePosition.right)
            VStack(spacing: 40){
                Text(userInfo.name)
                    .foregroundStyle(.white)
                    .bold()
                    .font(.title)
                VStack(spacing: 24){
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .foregroundStyle(.gray)
                    VStack(spacing: 8){
                        Text(userInfo.username)
                            .foregroundStyle(.white)
                            .bold()
                            .font(.title2)
                        HStack{
                            Text(userInfo.email)
                                .foregroundStyle(.white)
                                .font(.headline)
                            Divider()
                                .frame(height: 20)
                                .bold()
                                .overlay(.white)
                            Text(userInfo.phone)
                                .foregroundStyle(.white)
                                .font(.headline)
                        }
                        Link(destination: URL(string: "https://\(userInfo.website)")!) {
                            Text(userInfo.website)
                                .foregroundStyle(.blue)
                                .font(.headline)
                                .underline()
                        }
                        
                    }
                }
                VStack(spacing:24){
                    InfoRow(title1: "Company", title2: "Catch phrase", value1: userInfo.company.name, value2: userInfo.company.catchPhrase)
                    Divider()
                        .bold()
                        .overlay(.white)
                    InfoRow(title1: "Street", title2: "City", value1: userInfo.address.street, value2: userInfo.address.city)
                    Divider()
                        .bold()
                        .overlay(.white)
                    InfoRow(title1: "Suit", title2: "Zip Code", value1: userInfo.address.suite, value2: userInfo.address.zipCode)
                }
                ///Estos 2 botones daran un error ya que el simulador no puede realizar llamadas ni cuenta con la aplicacion de mail
                HStack(spacing:50){
                    Button{
                        userListViewModel.openPhone(phone: userInfo.phone)
                    } label: {
                        Image(systemName: "phone")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .frame(width: 60,height: 60)
                            .background(RoundedRectangle(cornerRadius: 45).fill(Color.green))
                    }
                    Button{
                        userListViewModel.openEmail(email: userInfo.email)
                    } label:{
                        Image(systemName: "envelope")
                            .resizable()
                            .frame(width: 40, height: 30)
                            .frame(width: 60,height: 60)
                            .background(RoundedRectangle(cornerRadius: 45).fill(Color.blue))
                    }
                    Button {
                        userListViewModel.openMap(lat: userInfo.address.geo.lat, lng: userInfo.address.geo.lng)
                    } label: {
                        Image(systemName: "map")
                            .resizable()
                            .frame(width: 40, height: 30)
                            .frame(width: 60,height: 60)
                            .background(RoundedRectangle(cornerRadius: 45).fill(Color.gray))
                    }

                    
                }
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.vertical, 16)
                .padding(.horizontal, 24)
        }.background(Color(.background))
            
    }
}


struct InfoRow: View {
    var title1 : String
    var title2 : String
    var value1 : String
    var value2: String
    
    var body: some View {
        HStack(spacing: 20){
            VStack(alignment: .leading, spacing: 8){
                Text(title1)
                    .foregroundStyle(.white)
                    .font(.caption2)
                Text(value1)
                    .foregroundStyle(.white)
                    .bold()
                    .font(.caption)
            }
            Spacer()
            Divider()
                .frame(height: 30)
                .bold()
                .overlay(.white.opacity(0.6))
            
            VStack(alignment: .leading,spacing: 8){
                Text(title2)
                    .foregroundStyle(.white)
                    .font(.caption2)
                Text(value2)
                    .foregroundStyle(.white)
                    .bold()
                    .font(.caption)
            }
            Spacer()
            
        }.frame(maxWidth: .infinity)
    }
}
