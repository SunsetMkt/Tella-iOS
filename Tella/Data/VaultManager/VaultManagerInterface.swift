//
//  Copyright © 2023 HORIZONTAL. All rights reserved.
//

import Foundation
import Combine

protocol VaultManagerInterface {
    
    var tellaData : TellaData? { get set }
    var shouldCancelImportAndEncryption : CurrentValueSubject<Bool,Never> { get set }
    var onSuccessLogin : PassthroughSubject<String,Never> { get set }
    
    func keysInitialized() -> Bool
    func login(password:String?) -> Bool
    func initKeys(_ type: PasswordTypeEnum, password:String)
    func updateKeys(_ type: PasswordTypeEnum, newPassword:String, oldPassword:String)
    func getPasswordType() -> PasswordTypeEnum
    
    func initFiles() -> AnyPublisher<[(VaultFileDB,String?)],Never>
    func loadFileData(fileName: String?) -> Data?
    func loadVaultFileToURL(file vaultFile: VaultFileDB) -> URL?
    func loadVaultFilesToURL(files vaultFiles: [VaultFileDB]) -> [URL]
    func loadFilesInfos(file vaultFile: VaultFileDB, offsetSize:Int ) -> VaultFileInfo?
    
    func save(_ data: Data, vaultFileId: String?) -> Bool?
    
    func saveDataToTempFile(data: Data?, pathExtension: String) -> URL?
    func saveDataToTempFile(data: Data?, fileName: String?, pathExtension: String) -> URL?
    
    func createTempFileURL(pathExtension: String) -> URL
    func createTempFileURL(fileName: String?, pathExtension: String) -> URL
    
    func deleteAllVaultFilesFromDevice()
    func deleteVaultFile(filesIds: [String])
    func clearTmpDirectory()
    func deleteContainerDirectory()
}
