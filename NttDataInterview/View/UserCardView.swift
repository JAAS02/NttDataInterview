//
//  UserCardView.swift
//  NttDataInterview
//
//  Created by Juan Antonio Ayala Sánchez on 13/02/25.
//

import SwiftUI

struct UserCardView: View {
    var name : String
    var email : String
    var phone : String
    
    
    var body: some View {
        HStack(spacing: 8){
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(.gray)
            
            VStack(alignment:.leading, spacing: 8){
                Text(name)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.white)
                    .bold()
                Text(email)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.white)
                    .font(.caption)
                Text(phone)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.white)
                    .font(.caption2)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .resizable()
                .frame(width: 8, height: 12)
                .foregroundStyle(.white)
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 8)
            .padding(.horizontal, 14)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color("CardBlack"), Color("CardWhite")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            ).clipShape(RoundedRectangle(cornerRadius: 12))
            .listRowBackground(Color(.background))
    }
}



#Preview {
    UserCardView(name: "Leanne Graham", email: "sincere@april.biz", phone: "aosihdoaihsd")
}
