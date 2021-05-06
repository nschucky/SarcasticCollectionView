//
//  StrategyViewController.swift
//  BrainZones
//
//  Created by Antonio Alves on 4/24/21.
//  Copyright © 2021 Antonio Alves. All rights reserved.
//

import UIKit

struct Content {
    let text: String
    let backgroundColor: UIColor
}

class ViewController: UICollectionViewController {
    
    let data = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit.", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", "Lorem ipsum dolor."]
    
    var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.size.width
        layout.estimatedItemSize = CGSize(width: width, height: 10)
        return layout
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(IronicCell.self, forCellWithReuseIdentifier: IronicCell.identifier)
        collectionView.collectionViewLayout = layout
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! MyCell
        cell.label.text = data[indexPath.item]
        return cell
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        layout.estimatedItemSize = CGSize(width: view.bounds.size.width, height: 10)
        super.traitCollectionDidChange(previousTraitCollection)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        layout.estimatedItemSize = CGSize(width: view.bounds.size.width, height: 10)
        layout.invalidateLayout()
        super.viewWillTransition(to: size, with: coordinator)
    }
}

class StrategyViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let collectionView: UICollectionView
    var content: [Content] = []
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 20
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        content.append(whenContent)
        content.append(howContent)
        content.append(Content(text: "Smaller huh?", backgroundColor: .systemRed))
        content.append(Content(text: "just a few lines, just a few lines, just a few lines, just a few lines, just a few lines, just a few lines, just a few lines, just a few lines, just a few lines, just a few lines, just a few lines, just a few lines, just a few lines, ", backgroundColor: .systemPurple))
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return content.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IronicCell.identifier, for: indexPath) as! IronicCell
        cell.setup(with: content[indexPath.item])
        return cell
    }
}



let whenContent = Content(text: "This is a fluid strategy we can use throughout a unit or even semester", backgroundColor: .systemGreen)

let howContent = Content(text:
    """
    👩🏽‍🍳 PREP
    • Students create two sets of cards:
    1️⃣ Vocab (or concept) cards
    2️⃣ Challenge cards (?)

    ♠️Cards - Create as a class
    • A traditional flashcard; words on the front, definitions on back
    • Challenge question cards.

    🧐 EXAMPLES:
    • Describe how you would use this (at home, in math, next week)
    • How would you explain this to an 8-year-old
    • How does, or might, this apply to your life
    • Why are you learning about this
    • Who could this help/harm
    • What is the opposite of this - explain

    🔂 Practice
    • Shuffle traditional cards
    • Shuffle challenge cards
    • Form two piles upside down

    ◉ DIRECTIONS
    • Pair students
    • Each draws from a different pile
    • Alternate - 1 person gives a definition and the other answers the challenge question
    • Switch roles for the next round

    🙋🏽 Stand-Up-Hand-Up-Pair-Up
    • Half the class uses challenge cards, the other half, traditional cards.
    • Pair with someone who has a different set of cards and respond.

    ♻️ Repeat with a new word and new partner

    If time allows, have students swap the set of cards they are using
    """, backgroundColor: .systemBlue)
