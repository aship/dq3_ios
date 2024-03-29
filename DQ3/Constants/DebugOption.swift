//
//  DebugOption.swift
//  DQ3
//
//  Created by aship on 2020/12/23.
//

// リリース時は全部 false
// debug で必要なら true にする

// ただし、デモ用途のためリリース時でも 以下 DebugSetAdventureLog は true でよいと思う
// 冒険の書1を特別な値にセット(アプリ初回起動時起のみ)
let DebugSetAdventureLog = true

// 以下は基本的には release 時には 全部 false にする

// アプリ起動時に任意の状態でスタートする
// ContentViewDebug.swift の setDebugCurrentMemory() を編集する
let DebugSetCurrentMemory = true

// 上記 DebugAdventureLog をアプリ起動時必ず行う
// false の時は、アプリ初回起動時のみ
// (以後アプリ起動時に冒険の書の上書きは行われない)
let DebugSetAdventureLogEveryAppLaunch = true

// BGM止める
let DebugStopBgm = false

// 戦闘エンカウントなし
let DebugNoBattle = false

// NPCを動かなくする
let DebugStopNpc = false
