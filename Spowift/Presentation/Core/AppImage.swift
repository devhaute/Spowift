//
//  AppImage.swift
//  Spowift
//
//  Created by kai on 3/14/24.
//

import SwiftUI

extension Image {
    enum App {
        static let tabSelectionStatusIcon = Image("tab_selection_status_icon")
        static let homeTabOn = Image("home_tab_on")
        static let playlistTabOn = Image("playlist_tab_on")
        static let historyTabOn = Image("history_tab_on")
        static let profileTabOn = Image("profile_tab_on")
        static let homeTabOff = Image("home_tab_off")
        static let playlistTabOff = Image("playlist_tab_off")
        static let historyTabOff = Image("history_tab_off")
        static let profileTabOff = Image("profile_tab_off")
        static let centerTab = Image("center_tab")
        static let rightArrow = Image("right_arrow")
        static let loggedOutBackground = Image("logged_out_background")
        static let search = Image("search")
        static let curveEffects = Image("curve_effects")
    }
}

// MARK: - Dummy Image
extension Image.App {
    static let dummyHomeBanner = Image("dummy_banner")
    static let dummyAlbumCovers = Image("dummy_album_covers")
    static let dummyArtistProfile = Image("dummy_artist_profile")
}
