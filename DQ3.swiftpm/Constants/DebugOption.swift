//
//  DebugOption.swift
//  DQ3
//
//  Created by aship on 2020/12/23.
//

// アプリ起動時の状態
// リリース時は .title にする
// 任意の状態でスタートしたい場合は .adventure_log_loaded
let debugDqMainState: DQMainState = .adventure_log_loaded

// リリース時は以下全部 false
// debug で必要なら true にする
// ただし、デモ用途のためリリース時でも 以下 DebugSetAdventureLog は true でよいと思う
// 冒険の書1を特別な値にセット(アプリ初回起動時起のみ)
let DebugSetAdventureLog = true

// 上記 DebugAdventureLog をアプリ起動時必ず行う
// false の時は、初回起動時のみ(冒険の書が以後上書きされない)
let DebugSetAdventureLogEveryAppLaunch = false

// BGM止める
let DebugStopBgm = false

// 最初から仲間いる状態
let DebugWithParty = false
