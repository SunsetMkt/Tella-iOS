//
//  Copyright © 2021 INTERNEWS. All rights reserved.
//

import SwiftUI

struct FileListView: View {
    
    @ObservedObject var appModel: MainAppModel
    var rootFile: VaultFile
    var fileType: FileType?
    var files: [VaultFile]
    
    init(appModel: MainAppModel, files: [VaultFile], fileType: FileType? = nil, rootFile: VaultFile) {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorColor = .clear
        UITableView.appearance().allowsSelection = false
        UITableViewCell.appearance().selectedBackgroundView = UIView()
        self.files = files
        self.fileType = fileType
        self.appModel = appModel
        self.rootFile = rootFile
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            List {
                ForEach(files, id: \.self) { file in
                    NavigationLink(destination: FileDetailView(file: file)){
                        FileListItem(file: file)
                            .frame(height: 50)
                    }
                }
                .listRowBackground(Styles.Colors.backgroundMain)
            }
            .listStyle(PlainListStyle())
            .background(Styles.Colors.backgroundMain)
            AddFileButtonView(appModel: appModel)
        }
        .navigationBarTitle("\(rootFile.fileName)")
    }
}

struct FileListItem: View {
    
    var file: VaultFile
    @State var showFileMenu: Bool = false
    
    var body: some View {
        HStack(spacing: 0){
            RoundedRectangle(cornerRadius: 5)
                .fill(Styles.Colors.fileIconBackground)
                .frame(width: 35, height: 35, alignment: .center)
                .overlay(
                    Image(uiImage: file.thumbnailImage)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .cornerRadius(5)
                )
            VStack(alignment: .leading, spacing: 0){
                Text(file.fileName ?? "N/A")
                    .font(Font(UIFont.boldSystemFont(ofSize: 14)))
                    .foregroundColor(Color.white)
                Text("\(file.created)")
                    .font(Font(UIFont.systemFont(ofSize: 10)))
                    .foregroundColor(Color(white: 0.8))
            }
            .padding(EdgeInsets(top: 0, leading: 27, bottom: 0, trailing: 16))
            Spacer()
            Button {
                showFileMenu = true
            } label: {
                Image("files.more")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        }
        .listRowBackground(Styles.Colors.backgroundMain)
        .background(Styles.Colors.backgroundMain)
        .frame(height: 45)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}

struct FileGridItem: View {
    var body: some View {
        HStack() {
            Image("test_image")
                        .resizable()
                        .frame(width: 35, height: 35)
                    Text("landmark.name")
        }
    }
}

struct FileListView_Previews: PreviewProvider {
    static var previews: some View {
        FileListView(appModel: MainAppModel(), files: VaultFile.stubFiles(), rootFile: VaultFile.stub(type: .folder))
    }
}

