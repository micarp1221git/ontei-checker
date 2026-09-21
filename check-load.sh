#!/bin/zsh
# 公開前チェック: index.html の <script> を読み込んで、読み込み時に落ちないかを確かめる（9/21・IOS未定義参照で全ボタンが死んだ再発防止）
# 使い方: zsh check-load.sh   → 「runtime load ok」以外なら push しない
cd "$(dirname "$0")"
node -e "
const fs=require('fs');const s=fs.readFileSync('index.html','utf8');const m=s.match(/<script>([\s\S]*)<\/script>/);
const el=()=>({hidden:false,textContent:'',className:'',style:{},classList:{add(){},remove(){}},addEventListener(){},parentElement:{hidden:false},children:[],appendChild(){},querySelectorAll:()=>[],dataset:{},getContext:()=>({})});
global.window={addEventListener(){},AudioContext:function(){this.state='running';this.resume=()=>Promise.resolve();}};global.navigator={userAgent:'iPhone',mediaDevices:{}};global.document={getElementById:el,querySelectorAll:()=>[],querySelector:el,addEventListener(){},createElement:el,body:el(),hidden:false};global.localStorage={getItem:()=>null,setItem(){}};global.Audio=function(){this.setAttribute=()=>{};this.play=()=>Promise.resolve();};global.URL={createObjectURL:()=>'blob:x'};global.Blob=function(){};global.requestAnimationFrame=()=>0;global.performance={now:()=>0};global.location={search:''};global.devicePixelRatio=1;
try{new Function(m[1])();console.log('runtime load ok')}catch(e){console.log('RUNTIME ERROR:',e.message);process.exit(1)}"
