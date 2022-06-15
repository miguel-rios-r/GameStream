//
//  EditProfileView.swift
//  GameViewApp
//
//  Created by Miguel Rios on 14/6/22.
//

import SwiftUI

struct EditProfileView: View {
    @State var profileImage: Image? = Image("profile")
    @State var isCameraActive = false
    var body: some View {
        ZStack {
            Color("Bg-Color").ignoresSafeArea()
            ScrollView {
                VStack {
                    Button(action: {
                        isCameraActive = true
                    }, label: {
                        profileImage!
                            .resizable()
                            .foregroundColor(.white)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .frame(width: 138, height: 118)
                            .sheet(isPresented: $isCameraActive, content: {
                                SUImagePickerView(sourceType: .camera, image: self.$profileImage, isPresented: $isCameraActive)
                            })
                    })
                    EditOptions()
                }
            }
        }
    }
}

struct EditOptions: View {
    @State var userEmail: String = ""
    @State var userPass: String = ""
    @State var userName: String = ""
    var body: some View {
        VStack(alignment: .leading) {
            Text("Email")
                .foregroundColor(Color("Dark-Cian"))
            ZStack(alignment:.leading){
                if userEmail.isEmpty{
                    Text("example@email.com")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                TextField("", text: $userEmail)
                    .foregroundColor(Color(.white))
            }
            
            Divider()
                .frame(height: 1)
                .background(Color("Dark-Cian"))
                .padding(.bottom)
            
            Text("Contraseña")
                .foregroundColor(Color("Dark-Cian"))
            ZStack(alignment:.leading){
                if userPass.isEmpty{
                    Text("***********")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                SecureField("", text: $userPass)
                    .foregroundColor(Color(.white))
            }
            
            Divider()
                .frame(height: 1)
                .background(Color("Dark-Cian"))
                .padding(.bottom)
            
            Text("Name")
                .foregroundColor(Color("Dark-Cian"))
            ZStack(alignment:.leading){
                if userName.isEmpty{
                    Text("Pepito Pérez")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                TextField("", text: $userName)
                    .foregroundColor(Color(.white))
            }
            
            Divider()
                .frame(height: 1)
                .background(Color("Dark-Cian"))
                .padding(.bottom)
            
            Button(action: {
                UpdateProfile()
            }, label: {
                Text("Update profile")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center )
                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                    .overlay(RoundedRectangle(cornerRadius: 6.0)
                                .stroke(Color("Dark-Cian"),
                                lineWidth: 1.0).shadow(color: .white, radius: 6)
                    )
            }).padding(.bottom, 70)
            
        }.padding(.top, 42).padding(.horizontal, 30)
    }
    
    func UpdateProfile() {
        let newUserData = SaveData()
        let result = newUserData.saveUserData(email: userEmail, pass: userPass, name: userName)
        print("Data saved ? \(result)")
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
