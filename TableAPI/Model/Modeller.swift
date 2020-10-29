//
//  Modeller.swift
//  TableAPI
//
//  Created by Field Employee on 10/29/20.
//

import UIKit

class Modeller {
    
    
    private var images: [UIImage] = []
    private var imageIDs: [String] = []
    var uri: String = "https://picsum.photos/300/300"
    
    func getPackage(table:UITableView, path:IndexPath) -> ImgBundle {
        if(path.row >= 0 && path.row < images.count){
            return (img: images[path.row],id:imageIDs[path.row])
        }
        else{
            self.images.append(UIImage())
            self.imageIDs.append("placeholder")

            NetworkManager.shared.fetchImage(str: uri ){ (image,id) in
                
                guard let data = image else {return}
                let imgid = id ?? "Basic"
                self.imageIDs[path.row] = "#: \(path.row) id: \(imgid)"
                self.images[path.row] = data
                
                DispatchQueue.main.async {
                    guard let cell = table.cellForRow(at: path) as? TableViewCell else {return}
                    cell.cellLabel.text = "#: \(path.row) id: \(imgid)"
                    cell.cellImage.image = data
                }
            }
            return (img: UIImage(),id: "Basic")
        }
    }
}
