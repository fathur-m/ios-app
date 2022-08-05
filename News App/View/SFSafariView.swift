//
//  SFSafariView.swift
//  News App
//
//  Created by Fathurrahman Muhammad on 02/08/22.
//

import SwiftUI
import SafariServices

struct SFSafariView: UIViewControllerRepresentable {
    typealias UIViewControllerType = SFSafariViewController
    let url: URL
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let vc = SFSafariViewController(url: url)
        return vc
    }
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        return
    }
}
