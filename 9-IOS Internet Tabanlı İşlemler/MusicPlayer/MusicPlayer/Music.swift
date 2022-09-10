//
//  Music.swift
//  MusicPlayer
//
//  Created by Furkan on 10.09.2022.
//

import Foundation

class Music : Codable{
    var music_id:String?
    var music_ad:String?
    var music_url:String?
    var music_img:String?
    init(Music_id:String,Music_ad:String,Music_url:String,Music_img:String){
        self.music_id = Music_id
        self.music_ad = Music_ad
        self.music_url = Music_url
        self.music_img = Music_img
    }
}
