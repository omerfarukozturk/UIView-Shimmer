//
//  ViewController.swift
//  ShimmerExamples
//
//  Created by Ömer Faruk Öztürk on 8.01.2021.
//

import UIKit
import UIView_Shimmer

final class SampleTableViewController: UITableViewController {
    
    private var isLoading = true {
        didSet {
            tableView.isUserInteractionEnabled = !isLoading
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Dashboard"
        isLoading = true
    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isLoading = false
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "SampleTableViewCellId", for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        /*
         Shimmering animation take the superviews' background color.
         
         So you can set background color to parent:
         cell.contentView.backgroundColor = .white
         
         or specify it with `color` parameter.
         */
        cell.setShimmeringAnimationWithSubviews(template: isLoading, color: .systemBackground)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = SampleDetailViewController()
        self.navigationController?.pushViewController(detailController, animated: true)
    }
}
