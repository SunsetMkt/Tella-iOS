//
//  CreateNewFolderBottomSheet.swift
//  Tella
//
//  
//  Copyright © 2021 INTERNEWS. All rights reserved.
//

import SwiftUI

enum FieldType {
    case text
    case fileName
}

struct TextFieldBottomSheet: View {
    
    var titleText = ""
    var validateButtonText = ""
    @Binding var isPresented: Bool
    @Binding var fieldContent : String
    var fileName : String = ""
    var fieldType : FieldType
    var didConfirmAction : (() -> ())
    
    @State private var isValid : Bool = false
    @State private var errorMessage : String = ""
    
    var body: some View {
        ZStack{
            DragView(modalHeight: 165,
                     isShown: $isPresented) {
                CreateNewFolderContentView
            }
        }
    }
    
    var CreateNewFolderContentView : some View {
        
        VStack(alignment: .leading) {
            Text(titleText)
                .foregroundColor(.white)
                .font(.custom(Styles.Fonts.boldFontName, size: 16))
            Spacer()
                .frame(height:12)
            
            TextField("", text: $fieldContent)
                .textFieldStyle(FileNameStyle())
                .onChange(of: fieldContent, perform: { value in
                    self.isValid = fieldContent.textValidator()
                })
            
            Spacer()
                .frame(height:8)
            
            Divider()
                .frame(height: 2)
                .background(Styles.Colors.buttonAdd)
            Spacer()
                .frame(height:4)
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(Styles.Colors.buttonAdd)
                    .font(.custom(Styles.Fonts.regularFontName, size: 12))
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Spacer()
            
            HStack {
                
                Spacer()
                
                BottomButtonActionSheetView(title: "CANCEL", shouldEnable: true) {
                    isPresented = false
                    fieldContent = ""
                }
                
                BottomButtonActionSheetView(title: validateButtonText, shouldEnable: self.isValid) {
                    
                    if fieldContent == fileName {
                        errorMessage = "Please enter a file name that is not currently in use"
                    } else {
                        isPresented = false
                        didConfirmAction()
                        fieldContent = ""
                        
                    }
                }
            }
        }.padding(EdgeInsets(top: 21, leading: 24, bottom: 0, trailing: 21))
    }
}

struct FileNameStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(.custom(Styles.Fonts.regularFontName, size: 14))
            .foregroundColor(Color.white)
            .accentColor(Styles.Colors.buttonAdd)
            .multilineTextAlignment(.leading)
            .disableAutocorrection(true)
            .textContentType(UITextContentType.oneTimeCode)
            .keyboardType(.alphabet)
    }
}

struct BottomButtonActionSheetView : View  {
    
    var title : String
    var shouldEnable : Bool
    var action: (() -> Void)
    
    var body: some View {
        
        Button(title) {
            UIApplication.shared.endEditing()
            action()
        }
        .font(.custom(Styles.Fonts.semiBoldFontName, size: 14))
        .foregroundColor(shouldEnable ? Color.white : Color.gray)
        .padding(EdgeInsets(top: 15, leading: 15, bottom: 21, trailing: 21))
        .disabled(!shouldEnable)
    }
}

struct CreateNewFolderBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldBottomSheet(titleText: "Test",
                             validateButtonText: "OK",
                             isPresented: .constant(true),
                             fieldContent: .constant("Test"),
                             fileName: "name",
                             fieldType: FieldType.fileName,
                             didConfirmAction: {})
    }
}
