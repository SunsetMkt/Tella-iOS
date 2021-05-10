//
//  Copyright © 2021 INTERNEWS. All rights reserved.
//

import SwiftUI

struct FileGroupsView: View {

    init() {
    }
    
    var body: some View {
        VStack(spacing: 0){
            Text("Files")
                .font(Font(UIFont.boldSystemFont(ofSize: 14)))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 24, alignment: .topLeading)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 16, trailing: 16))
            VStack(spacing: 0) {
                // TODO: replace with LazyVGridView once iOS 13 not supported
                HStack(spacing: 0){
                    Button(action: {}) {
                        FileGroupView(groupName: "My Files", iconName: "files.my_files")
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 8))
                    }
                    Button(action: {}) {
                        FileGroupView(groupName: "Gallery", iconName: "files.gallery")
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 16, trailing: 0))
                    }
                }
                HStack(spacing: 0){
                    Button(action: {}) {
                        FileGroupView(groupName: "Audio", iconName: "files.audio")
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8))
                    }
                    Button(action: {}) {
                    FileGroupView(groupName: "Documents", iconName: "files.documents")
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                    }
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                HStack(spacing: 0){
                    Button(action: {}) {
                        FileGroupView(groupName: "Others", iconName: "files.others")
                    }
                }
            }.padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))

        }
        .background(Color(Styles.Colors.backgroundMain))
    }
}

struct FileGroupsView_Previews: PreviewProvider {
    static var previews: some View {
        FileGroupsView()
    }
}
