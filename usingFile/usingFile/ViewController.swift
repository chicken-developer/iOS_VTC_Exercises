//
//  ViewController.swift
//  usingFile
//
//  Created by Nguyen Manh Quynh on 12/13/19.
//  Copyright © 2019 Admin. All rights reserved.
//

     //temp File
//        let tmpDir = NSTemporaryDirectory()
//        print(tmpDir)
//
//        //Change directoryPath
//        let dirPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
//        let docsDir_2 = dirPath[0].path
//
//        if fileManager.changeCurrentDirectoryPath(docsDir_2){
//
//            print("Now direction is: ", docsDir_2)
//        }else{
//            print("Have err")
//        }
//
//        //Create File
//        let newDir = dirPath[0].appendingPathComponent("newFolder").path
//        do{
//            try fileManager.createDirectory(atPath: newDir, withIntermediateDirectories: true, attributes: nil)
//        }catch let error {
//            print(error.localizedDescription)
//        }
//
//        //delete File
//        do{
//            try fileManager.removeItem(atPath: newDir)
//        }catch let error2{
//            print(error2.localizedDescription)
//        }
//
//
//        //print folder tree
//        do {
//            let fileList = try fileManager.contentsOfDirectory(atPath: "/")
//            for filename in fileList{
//                print(filename)
//            }
//        }catch let error3{
//                print(error3.localizedDescription)
//            }
//
//
//         //Check properties file
//
//        do {
//            let arrribs : Dictionary = try fileManager.attributesOfItem(atPath: docsDir_2 + "/FSOFT_Student_Test_Java.docx") as Dictionary
//            let type = arrribs[FileAttributeKey.type] as! String
//            print(type)
//            } catch let error4{
//                print(error4.localizedDescription)
//        }

import UIKit

class ViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //document File
//        let fileManager : FileManager = FileManager.default
//        let currentPath = fileManager.currentDirectoryPath
//        _ = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
//        let docsDir = currentPath
//        let tmpDir = NSTemporaryDirectory()
//           print(tmpDir)
//        print(docsDir)
//
        //Paste comment codes here
//        if fileManager.fileExists(atPath: "/App"){
//            print("File exist")
//        }else{
//            print("Must create file")
//        }
         //Equal file
//        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
//        let url = NSURL(fileURLWithPath: path)
//        let fileManager : FileManager = FileManager.default
//        if let pathComponent1 = url.appendingPathComponent("01.jpg"){
//            if let pathComponent2 = url.appendingPathComponent("01copy.jpg"){
//                let filePath1 = pathComponent1.path
//                let filePath2 = pathComponent2.path
//                let isEqual = fileManager.contentsEqual(atPath: filePath1, andPath: filePath2)
//                if isEqual{
//                    print("Text01 = Text02")
//                }else{
//                    print("Text 01 != Text02 ")
//                }
//            }
//        }

        
        //Kiem tra quyen doc/ ghi
//         let fileManager : FileManager = FileManager.default
//         let dirPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
//         var docsDir = dirPath[0].path
//         docsDir = docsDir + "/FSOFT_Java.docx"
//        // Now is in /Documents.
//        //IF want to go into file in Document: fileManager.isReadableFile(atPath: docsDir + "/FileName.extension")
//        if fileManager.isReadableFile(atPath: docsDir)
//        {
//            print("File is readable")
//        }  else
//        { print("File not readable")}
//
//        if fileManager.isWritableFile(atPath: docsDir)
//        {
//            print("File is writeable")
//        }  else
//        { print("File not writeable")}
//
//        if fileManager.isDeletableFile(atPath: docsDir)
//        {
//            print("File is deleteable")
//        }  else
//        { print("File not deleteable")}
//
//        if fileManager.isExecutableFile(atPath: docsDir)
//        {
//            print("File is excuteable")
//        }  else
//        { print("File not excutable")}
        //
//
        
//        let fileManager : FileManager = FileManager.default
//        let dirPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
//        let docsDir = dirPath[0].path
//        let tempDir = NSTemporaryDirectory()
//        print("Folder goc: ", docsDir)
//        print("Folder chuyen den: ", tempDir)
//
      
//        do{
//            try fileManager.moveItem(atPath: docsDir + "/moveFolder", toPath: tempDir + "/moveFolder")
//        } catch let error{
//            print(error.localizedDescription)
//        }
//
//        do{
//            try fileManager.copyItem(atPath: docsDir + "/newFolder", toPath: tempDir + "/newFolder")
//        } catch let error2{
//            print(error2.localizedDescription)
//        }
//
//        do{
//            try fileManager.removeItem(atPath: docsDir + "/deleteFolder")
//        } catch let error3{
//            print(error3.localizedDescription)
//        }
        
        //create and write to a new file
      //  let fileManager : FileManager = FileManager.default
       // let strDataToWrite = "Hello VTC Academy. I'm student ver 2".data(using: .utf8)
       // let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
       // let documentPath = NSURL(fileURLWithPath: path)
       // guard let fileName = documentPath.appendingPathComponent("demo_2.txt")?.path else { return }
      //  let isCreateSuccess = fileManager.createFile(atPath: fileName, contents: strDataToWrite, attributes: nil)
        // print("Link: ", path)
//        if isCreateSuccess {print("Create successed ")} else{ print("Fail to create file")}
//
//        //read file
//        if isCreateSuccess{
//            let data = NSData(contentsOfFile: fileName)
//            if (data != nil) {
//                let strDataToRead = String(decoding: data!, as: UTF8.self)
//            print(strDataToRead)
//            }
////        }
//        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
//        print("Link: ", path)
//        let file: FileHandle? = FileHandle(forReadingAtPath: path + "/demo_2.txt")
//        if file == nil{
//            print("Fail to open file")
//        } else{
//            file?.seek(toFileOffset: 36)
//            let dataBuffer = (file?.readData(ofLength: 3))!
//            let fullData = (file?.readDataToEndOfFile())!
//            let strDataToRead = String(decoding: dataBuffer, as: UTF8.self)
//
//            let fullDataToRead = String(decoding: fullData, as: UTF8.self)
//            print(strDataToRead)
//            print(fullDataToRead)
//            file?.closeFile()
//        }
//
        
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        print("Link: ", path)
        let file: FileHandle? = FileHandle(forUpdatingAtPath: path + "/demo_2.txt")
        if file == nil{
            print("Fail to open file")
        } else{
            
            if let data = file?.readDataToEndOfFile(){
                file?.seek(toFileOffset: (file?.seekToEndOfFile())!)
                file?.write(data)
                file?.closeFile()
            }
           
        }
        
        
    }
}


