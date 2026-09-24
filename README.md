# 音程チェッカー

声の高さを「ドレミ＋何セントずれ＋オクターブ」で見せる、声の人のための音程チェッカー。ボイストレーナーみか監修。

- Web版: https://micarp1221git.github.io/ontei-checker/
- 3画面: さがす（すべらせて探す練習）／ピッチ計／音域
- 音声は端末内だけで処理（自己相関法・`framePitchACF`）。通信なし
- 設計の出どころ: MIKA_VAULT `06_Projects/20260920_音程チェックアプリ/設計_v0.md`

## 開発
1ファイルPWA（`index.html`）。`python3 -m http.server` でローカル確認。
`window.__ontei` にテスト用の関数を出している（`framePitchACF` / `hzToMidiF`）。

## 曲を足すとき

[曲の足し方.md](曲の足し方.md) の手順どおりに進める（著作権の確認・書き方・テンポ・出す前の確かめ）。
