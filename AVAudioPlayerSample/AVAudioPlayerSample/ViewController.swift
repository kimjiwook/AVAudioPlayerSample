//
//  ViewController.swift
//  AVAudioPlayerSample
//
//  Created by JW_Macbook on 29/05/2019.
//  Copyright © 2019 JW_Macbook. All rights reserved.
//

import UIKit
// 1. Import AVFondation 추가하기.
import AVFoundation

class ViewController: UIViewController {

    // 2. AVAudioPlayer 변수 설정 (지역변수 설정시 ARC에 의해 함수 실행 후 바로 종료됨)
    var avPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 초기화
        self.initAudio_asset()
        // self.initAudio_path()
    }
    
    // #. 오디오 실행함수. (asset 파일 사용)
    func initAudio_asset() {
        guard let sound = NSDataAsset(name: "chatVideo_asset") else {print("Asset load error"); return}
        do {
            try self.avPlayer = AVAudioPlayer(data: sound.data)
            self.avPlayer.prepareToPlay()
        } catch let error as NSError {
            print("\(error.localizedDescription)")
        }
    }
    
    // #. 오디오 실행함수. (path 파일 사용)
    func initAudio_path() {
        guard let sound = Bundle.main.path(forResource: "chatVideo_path", ofType: ".mp3") else {print("Asset load error"); return}
        do {
            try self.avPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
            self.avPlayer.prepareToPlay()
        } catch let error as NSError {
            print("\(error.localizedDescription)")
        }
    }
    
    //MARK:-
    //MARK: IBAction 관련.
    
    /// 1. 실행
    ///
    /// - Parameter sender:
    @IBAction func doPlay(_ sender: Any) {
        self.avPlayer.play()
    }
    
    
    /// 2. 중지
    ///
    /// - Parameter sender:
    @IBAction func doPause(_ sender: Any) {
        self.avPlayer.pause()
    }
    
    
    /// 3. 멈춤
    ///
    /// - Parameter sender:
    @IBAction func doStop(_ sender: Any) {
        self.avPlayer.stop()
    }
}
