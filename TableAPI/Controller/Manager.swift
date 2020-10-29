//
//  Modeller.swift
//  TableAPI
//
//  Created by Field Employee on 10/29/20.
//

import UIKit

class Manager {
    
    
    private var images: [UIImage] = []
    private var imageIDs: [String] = []
    var urlEntry: String = "https://picsum.photos/300/300"
    
    func getIt(table:UITableView, path:IndexPath) -> ImgBundle {
        if(path.row >= 0 && path.row < images.count){
            return (img: images[path.row],id:imageIDs[path.row])
        }
        else{
            self.images.append(UIImage())
            self.imageIDs.append("placeholder")

            NetworkManager.shared.fetchImage(str: urlEntry ){ (image,id) in
                
                guard let imageData = image else {return}
                let imgid = id ?? "Basic"
                self.imageIDs[path.row] = "Likes: \((path.row+1)*2) id: \(imgid)"
                self.images[path.row] = imageData
                DispatchQueue.main.async {
        
                    guard let cell = table.cellForRow(at: path) as? TableViewCell else {return}
                    cell.cellLabel.text = "Likes: \((path.row+1)*2) id: \(imgid)"
                    cell.cellImage.image = imageData
                }
            }
            return (img: UIImage(),id: "Basic")
        }
    }
}
