//
//  ProfileView.swift
//  GameViewApp
//
//  Created by Miguel Rios on 14/6/22.
//

import SwiftUI

struct ProfileView: View {
    @State var userName = ""
    @State var profileImage: UIImage = UIImage(named: "profile")!
    var body: some View {
        ZStack{
            Color("Bg-Color").ignoresSafeArea().navigationBarHidden(true).navigationBarBackButtonHidden(true)
            VStack {
                Text(userName)
                    .font(.title2)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 15, trailing: 0))
                ScrollView {
                    Image(uiImage: profileImage)
                        .resizable()
                        .foregroundColor(.white)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 118, height: 118)
                        .clipShape(Circle())
                    Settings()
                }.padding(.bottom, 8)
            }
        }
            .onAppear(
                perform: {
                    // Get User Data
                    if UserDefaults.standard.object(forKey: "userData") != nil {
                        userName = UserDefaults.standard.stringArray(forKey: "userData")![2]
                    }
                    // Profile Image
                    if getUiImage(named: "profilePhoto") != nil {
                        profileImage = getUiImage(named: "profilePhoto")!
                    } else {
                        print("Profile photo no found")
                    }
                }
            )
    }
    
    func getUiImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
    
}

struct Settings: View {
    @State var isToggleOn = true
    @State var isEditViewActive = false
    
    var body: some View {
        VStack{
            Text("Settings")
                .foregroundColor(.white)
                .font(.title3)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            Button(action: {}, label: {
                HStack {
                    Text("Account")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                }.padding().background(Color("Blue-Gray")).clipShape(RoundedRectangle(cornerRadius: 5))
            })
            Button(action: {}, label: {
                HStack {
                    Text("Notifications")
                        .foregroundColor(.white)
                    Spacer()
                    Toggle("", isOn: $isToggleOn)
                }.padding().background(Color("Blue-Gray")).clipShape(RoundedRectangle(cornerRadius: 5))
            })
            Button(action: {
                isEditViewActive = true
            }, label: {
                HStack {
                    Text("Edit profile")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                }.padding().background(Color("Blue-Gray")).clipShape(RoundedRectangle(cornerRadius: 5))
            })
            
            Button(action: {
                isEditViewActive = true
            }, label: {
                HStack {
                    Text("Rate the app")
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                }.padding().background(Color("Blue-Gray")).clipShape(RoundedRectangle(cornerRadius: 5))
            })
            
            NavigationLink(
                destination: EditProfileView(),
                isActive: $isEditViewActive,
                label: {
                    EmptyView()
                }
            )
            
        }.padding(.horizontal, 30)
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
