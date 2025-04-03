_Fix   ← {𝔽∘⊢⍟≢⟜𝔽_𝕣∘⊢⍟≢⟜𝔽𝕩}
Depth  ⇐ {d←≠⟜(↕≠)𝕩⋄𝕩⊸{d+↩𝕩≠z←𝕩⊏𝕨⋄z}_Fix 𝕩⋄d}

p←0‿0‿1‿2‿0‿2‿0‿4

Depth p

i←(↕≠p)=⌜Depth p #nodes
n←{𝕩∧1+p}˘i # assign parent value + 1 (zero means nothing value)
n↩∾˘(↕≠n) {«⍟𝕨 𝕩}˘n # shift all to left most column

# branches
s←0<∊⊸∧˘n ⋄ e←0<(⌽∘∊∘⌽)⊸∧˘n ⋄ h←s{+`𝕨-𝕩}˘e ⋄ m←0<h∧n ⋄ v←s∧e # s: start, e: ends, h: horizontals, m: middles, v: verticals 
b←" ─┬├┐│"⊏˜((≠n)⥊0)∾1↓⌈´h‿m‿s‿e‿v×¨1+↕5 # branches - disregards first branch. 1: horizontal, 2: middle, 3: start, 4: end, 5: vertical, 

# vertices
o←∧⟜(1+↕≠i)˘i
o↩∾˘(↕≠i){«⍟𝕨 𝕩}˘o # shift all to left most column
o↩∾˘(0⊸≢)◶" "‿{•Fmt 𝕩-1}¨o # convert nodes to characters

# print
•Out˘b{𝕨∾(@+10)∾𝕩}˘o
