//
//  BlankFormsView.swift
//  Tella
//
//  Created by Ahlem on 15/06/2021.
//  Copyright © 2021 INTERNEWS. All rights reserved.
//

import SwiftUI

struct BlankFormsView: View {
    @ObservedObject var formViewModel = FormViewModel()
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 0){
                ScrollView{
                    ForEach(formViewModel.forms) { formModel in
                        FormsCellView(formModel: formModel)
                    }
                }
            }.background(Color(Styles.Colors.backgroundMain))
            
        }
        
    }
}

struct BlankFormsView_Previews: PreviewProvider {
    static var previews: some View {
        BlankFormsView()
    }
}
