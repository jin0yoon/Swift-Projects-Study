//
//  SenderView.swift
//  SavingImgCoreData
//
//  Created by 윤진영 on 2021/06/26.
//

import SwiftUI

struct SenderView: View {
    //need this moc here to send all the info to the main view
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State var image : Data = .init(count: 0)
    
    @State var show = false
    
    @State var name = ""
    
    @State var description = ""
    
    var body: some View {
        NavigationView{
            VStack{
                
                if self.image.count != 0{
                    Button(action: {
                        self.show.toggle()
                    }){
                        Image(uiImage: UIImage(data: self.image)!)
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(6)
                    }
                }else{
                    Button(action: {
                        self.show.toggle()
                    }){
                        Image(systemName: "photo.fill")
                            .font(.system(size: 55))
                            .foregroundColor(.gray)
                    }
                    
                }
                
                TextField("description...", text: self.$description)
                    .padding()
                    .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
                    .cornerRadius(20)
                
                TextField("name...", text: self.$name)
                    .padding()
                    .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
                    .cornerRadius(20)
                
                Button(action: {
                    //Save to CoreData
                    let send = Saving(context: self.moc)
                    send.username = self.name
                    send.descriptions = self.description
                    send.imageD = self.image
                    
                    try? self.moc.save()
                    self.presentationMode.wrappedValue.dismiss()
                    self.name = ""
                    self.description = ""
                    
                }){
                    Text("Send")
                        .fixedSize()
                        .frame(width: 250, height: 30)
                        .foregroundColor((self.name.count>0 && self.description.count>0 && self.image.count>0) ? Color.white : Color.black)
                        .background((self.name.count>0 && self.description.count>0 && self.image.count>0) ? Color.blue : Color.gray)
                        .cornerRadius(13)
                }
                
            }
            .navigationBarItems(trailing: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }){
                Text("Cancel")
            })
        }
        .sheet(isPresented: self.$show, content: {
            ImagePicker(show: self.$show, image: self.$image)
        })
    }
}

struct SenderView_Previews: PreviewProvider {
    static var previews: some View {
        SenderView()
    }
}
