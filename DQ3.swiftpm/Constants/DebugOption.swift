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
// false の時は、アプリ初回起動時のみ生成
// (以後アプリ起動時に冒険の書の上書きは行われない)
let DebugSetAdventureLogEveryAppLaunch = true

// BGM止める
let DebugStopBgm = true

// 最初から仲間いる状態
let DebugWithParty = false

// NPCを動かなくする
let DebugStopNpc = false

// 戦闘のエンカウントなし
let DebugNoBattle = false
