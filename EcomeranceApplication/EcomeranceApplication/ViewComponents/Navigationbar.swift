//
//  Navigationbar.swift
//  EcomeranceApplication
//
//  Created by Mashhood Qadeer on 15/05/2021.
//

import Foundation
import SwiftUI

struct Navigationbar :  View {
    var navTapped: ( () -> Void )?
    var profileTapped: ( () -> Void )?
    @Binding var navBarButtonIcon: String
    @Binding var profileImage: String
    var body : some View {
        HStack(){
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: self.navBarButtonIcon)
                    .font(.system(size: 25, weight:.heavy))
                    .foregroundColor(.black)
            })
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image( self.profileImage )
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45, alignment: .center)
            })
            }
    }
}
