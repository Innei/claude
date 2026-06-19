#!/bin/sh
ENTRY="$(ls -d "$HOME"/.claude/plugins/cache/claude-dashboard/claude-dashboard/*/dist/index.js 2>/dev/null | sort -V | tail -1)"
INPUT="$(cat)"
PRETTY="$(printf '%s' "$INPUT" | node -e '
let d="";process.stdin.on("data",x=>d+=x).on("end",()=>{
  try{
    const j=JSON.parse(d);
    const id=(j.model&&j.model.id)||"";
    const m=id.match(/^claude-([a-z]+)-(\d+)-(\d+)/i);
    if(m){
      const cap=m[1].charAt(0).toUpperCase()+m[1].slice(1);
      process.stdout.write(cap+" "+m[2]+"."+m[3]);
    } else if(j.model&&j.model.display_name){
      process.stdout.write(j.model.display_name);
    }
  }catch{}
})' 2>/dev/null)"
printf '%s' "$INPUT" | node "$ENTRY" \
  | PRETTY="$PRETTY" perl -pe 'BEGIN{$p=$ENV{PRETTY}||""} s/\b(Opus|Sonnet|Haiku|Fable)\b/$p/g if length $p' \
  | perl -pe 's/│((?:\e\[[0-9;]*m)*) ((?:\e\[[0-9;]*m)*)(\d+%)/│$1 ${2}ctx: $3/'
