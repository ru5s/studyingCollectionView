//
//  ViewController.swift
//  MyFewCollectionInProject
//
//  Created by Ruslan Ismailov on 11/09/22.
//

import UIKit

struct Num {
    var num: Int
}

class ViewController: UIViewController {
    
    var items: [Num] = [Num(num: 1), Num(num: 2), Num(num: 3), Num(num: 4), Num(num: 5), Num(num: 6),]
    var items2: [Num] = [Num(num: 7), Num(num: 8), Num(num: 9), Num(num: 10), Num(num: 11), Num(num: 12),]
    
    var collection: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    var secondCollection: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    let secondLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //Create horizontal collection
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        collection.setCollectionViewLayout(layout, animated: true)

        layout.itemSize = CGSize(width: 170, height: 300)
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        collection.layer.cornerRadius = 5
        
        collection.delegate = self
        collection.dataSource = self
        
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCellCollectionFirst")
        
        
        
        view.addSubview(collection)
        
        //Create vertical collection
        secondLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        secondCollection.setCollectionViewLayout(secondLayout, animated: true)

        secondLayout.itemSize = CGSize(width: view.bounds.width - 20, height: 200)
        secondLayout.minimumInteritemSpacing = 20
        secondLayout.minimumLineSpacing = 20
        secondCollection.layer.cornerRadius = 5
        
        secondCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCellCollectionSecond")
        
        secondCollection.delegate = self
        secondCollection.dataSource = self
        
        view.addSubview(secondCollection)
        
        collection.reloadData()
        secondCollection.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        
        
        
        addCollectionView(myView: collection, centerX: true, centerY: false, top: 50, width: view.bounds.width - 20, height: 300)
        collection.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true

        
        addCollectionView(myView: secondCollection, centerX: true, centerY: false, top: 50, width: view.bounds.width - 20, height: 225)
        secondCollection.topAnchor.constraint(equalTo: collection.bottomAnchor, constant: 20).isActive = true
        
        
    }
    
    
    func addCollectionView(myView: UICollectionView, centerX: Bool, centerY: Bool, top: CGFloat, width: CGFloat, height: CGFloat){
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = centerX
        myView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = centerY
//        myView.topAnchor.constraint(equalTo: view.topAnchor, constant: top).isActive = true
        myView.widthAnchor.constraint(equalToConstant: width).isActive = true
        myView.heightAnchor.constraint(equalToConstant: height).isActive = true
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collection {
            return items.count
        }
        if collectionView == secondCollection {
            return items2.count
        }
        
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
     
        
        let labelFirst = UILabel()
        let label = UILabel()
        
        let task = items[indexPath.item].num
        
        if collectionView == self.collection {

            let cell = collection.dequeueReusableCell(withReuseIdentifier: "MyCellCollectionFirst", for: indexPath)

            cell.addSubview(labelFirst)
                        
            labelFirst.translatesAutoresizingMaskIntoConstraints = false
            labelFirst.topAnchor.constraint(equalTo: cell.topAnchor, constant: 10).isActive = true
            labelFirst.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 10).isActive = true
            labelFirst.font = UIFont(name: "helvetica", size: 30)
            labelFirst.textColor = .black
            
            labelFirst.text = String(task)
            
            cell.backgroundColor = .gray
            cell.layer.borderColor = CGColor(gray: 1, alpha: 1)
            cell.layer.cornerRadius = 5

            return cell
        }
        
        if collectionView == self.secondCollection {

            
            let cell = secondCollection.dequeueReusableCell(withReuseIdentifier: "MyCellCollectionSecond", for: indexPath)
            
            cell.addSubview(label)
            
            label.translatesAutoresizingMaskIntoConstraints = false
            label.topAnchor.constraint(equalTo: cell.topAnchor, constant: 10).isActive = true
            label.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 10).isActive = true
            label.font = UIFont(name: "helvetica", size: 30)
            label.textColor = .white

            label.text = String(items2[indexPath.row].num)

            cell.backgroundColor = .purple
            cell.layer.borderColor = CGColor(gray: 1, alpha: 1)
            cell.layer.cornerRadius = 5

            return cell
        }
        
//        return cell
        return UICollectionViewCell()
        
    }
    
    
    
    
}

