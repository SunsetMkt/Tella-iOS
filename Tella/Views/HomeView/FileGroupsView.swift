//
//  Copyright © 2021 INTERNEWS. All rights reserved.
//

import SwiftUI

struct FileGroupsView: View {

    @ObservedObject var appModel: MainAppModel

    init(viewModel: MainAppModel) {
        self.appModel = viewModel
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
                    NavigationLink(destination: FileListView(files: appModel.fileManager.root.files, fileType: nil)) {
                        FileGroupView(groupName: "My Files", iconName: "files.my_files")
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 8))
                    }
                    NavigationLink(destination: FileListView(files: appModel.fileManager.root.files, fileType: .image)) {
                        FileGroupView(groupName: "Gallery", iconName: "files.gallery")
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 8))
                    }
                }
                HStack(spacing: 0){
                    NavigationLink(destination: FileListView(files: appModel.fileManager.root.files, fileType: .image)) {
                        FileGroupView(groupName: "Audio", iconName: "files.audio")
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 8))
                    }
                    NavigationLink(destination: FileListView(files: appModel.fileManager.root.files, fileType: .document)) {
                        FileGroupView(groupName: "Documents", iconName: "files.documents")
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 8))
                    }
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0))
                HStack(spacing: 0){
                    NavigationLink(destination: FileListView(files: appModel.fileManager.root.files, fileType: .document)) {
                        FileGroupView(groupName: "Others", iconName: "files.others")
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 8))
                    }
                }
            }.padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 16))

        }
        .background(Color(Styles.Colors.backgroundMain))
    }
}

struct FileGroupsView_Previews: PreviewProvider {
    static var previews: some View {
        FileGroupsView(viewModel: MainAppModel())
    }
}

