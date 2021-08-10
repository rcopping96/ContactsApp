//
//  Audio.swift
//  Contacts
//
//  Created by Rob Copping on 09/08/2021.
//

import AVFoundation

func configureAudioSession() {
    print("Setting up Audio")
    let session = AVAudioSession.sharedInstance()
    
    do {
        try session.setCategory(.playAndRecord, mode: .voiceChat, options: [])
    } catch (let error) {
        print("Error setting up audio: \(error)")
    }
}

func startAudio() {
    print("Starting Audio")
}

func stopAudio() {
    print("Stopping Audio")
}
