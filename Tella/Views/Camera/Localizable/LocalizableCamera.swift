//
//  Copyright © 2022 INTERNEWS. All rights reserved.
//

import Foundation

enum LocalizableCamera: String, LocalizableDelegate {

    case addFileProgressTitle = "CameraAddFileProgressTitle"
    case addFileProgressComplete = "CameraAddFileProgressComplete"
    case cancelAddFileTitle = "CameraCancelAddFileTitle"
    case cancelAddFileMessage = "CameraCancelAddFileMessage"
    case cancelAddFileButtonTitle = "CameraCancelAddFileButtonTitle"
    case cancelAddFileBackButtonTitle = "CamerCancelAddFileBackButtonTitle"
    
    case deniedPermissionMessage = "CameraDeniedPermissionMessage"
    case deniedPermissionButtonTitle = "CameraDeniedPermissionButtonTitle"

    var tableName: String? {
        return "Camera"
    }
    
}
