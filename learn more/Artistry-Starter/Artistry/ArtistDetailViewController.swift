/*
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

class ArtistDetailViewController: UIViewController {
  
  var selectedArtist: Artist!
  
  let moreInfoText = "Select For More Info >"
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = selectedArtist.name
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 300
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    NotificationCenter.default.addObserver(forName: .UIContentSizeCategoryDidChange, object: .none, queue: OperationQueue.main) { [weak self] _ in
      self?.tableView.reloadData()
    }
  }
}

extension ArtistDetailViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return selectedArtist.works.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "WorkTableViewCell", for: indexPath) as! WorkTableViewCell
    
    let work = selectedArtist.works[indexPath.row]
    
    cell.workTitleLabel.text = work.title
    cell.workImageView.image = work.image
    
    cell.workTitleLabel.backgroundColor = UIColor(white: 204/255, alpha: 1)
    cell.workTitleLabel.textAlignment = .center
    cell.moreInfoTextView.textColor = UIColor(white: 114 / 255, alpha: 1)
    cell.selectionStyle = .none
    
    return cell
  }
}

extension ArtistDetailViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // 1.You ask the tableview for a reference to the cell that corresponds to the selected index path and then get the corresponding Work
    guard let cell = tableView.cellForRow(at: indexPath) as? WorkTableViewCell else { return }
    
    var work = selectedArtist.works[indexPath.row]
    
    // 2.You change the isExpanded state of the Work object, and then stuff it back into the array (which is necessary because structs are passed by copy).
    work.isExpanded = !work.isExpanded
    selectedArtist.works[indexPath.row] = work
    
    // 3.Next, you alter the text view of the cell, depending on if the work is expanded or not: If it is, you’re setting the text view to display the work’s info property and changing the text alignment to .left. If it isn’t expanded, you’re setting the text back to “Select to See More >” and the alignment back to .center.
    cell.moreInfoTextView.text = work.isExpanded ? work.info : moreInfoText
    cell.moreInfoTextView.textAlignment = work.isExpanded ? .left : .center
    
    // 4.The table view needs to refresh the cell heights now. Calling beginUpdates() and endUpdates() will force the table view to refresh the heights in an animated fashion.
    tableView.beginUpdates()
    tableView.endUpdates()
    
    // 5.Finally, you tell the table view to scroll the selected row to the top of the table view in an animated fashion.
    tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    
    cell.moreInfoTextView.text = work.isExpanded ? work.info : moreInfoText
    cell.moreInfoTextView.textAlignment = work.isExpanded ? .left : .center
    
    cell.workTitleLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
    cell.moreInfoTextView.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.footnote)
  }
  
}


