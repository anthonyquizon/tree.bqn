
Parent ⇐ { g←⊔𝕩 ⋄ (↕≠𝕩) {a‿w←𝕨 ⋄ (⊏⟜a 1-˜a⍋w)⌾(w⊸⊏) 𝕩 }´ (1↓(»g){𝕨‿𝕩}¨g) }
Delete ⇐ { (/¬𝕨)(⊢-⍋)𝕨/𝕩 } # delete from parent vector
Leaf   ⇐ { ¬(↕≠𝕩)⍷𝕩 }
Depth  ⇐ { p←𝕩 ⋄ d←p≠(↕≠p) ⋄ { z←𝕩⊏p ⋄ d+↩z≠𝕩 ⋄ z } _Fix p ⋄ d } 
_Fix   ← {𝔽∘⊢⍟≢⟜𝔽_𝕣∘⊢⍟≢⟜𝔽𝕩}

# example:
# ○
# ├─┬─┐
# ○ ○ ○

⟨none, horz, mid, start, end, vert⟩ ← ↕6

Draw ⇐ {
    𝕊 𝕩: ((≠𝕩)⥊'○') 𝕊 𝕩;
  𝕨 𝕊 𝕩:
    ch ← •Type◶⟨⊢,(0⊸⊑)∘•Fmt, ⊢⟩¨𝕨 
    ⋄ p←𝕩 ⋄ r←{𝕩⊏p} _fix p ⋄ d←Depth 𝕩                    # r: roots. d: depth
    {
      par←@ ⋄ h←@ ⋄ n←@ ⋄ m←𝕩=r                         # init empty variables for hacking convience and mask for current root
      par↩{ (1+𝕩/m/p)⌾(𝕩⊸/) 𝕩 }˘m⊸/˘d=⌜˜↕⌈´d+1          # depth matrix to parent vector offset by 1 since null values are 0
      par↩∾˘(↕≠par) {«⍟𝕨 𝕩} ˘par                        # shift diagonal zeros to vertical line
      s←×⟜∊˘par×>⟜»˘par ⋄ e←×⟜{⌽∊⌽𝕩}˘ par×>⟜«˘par       # mark start and ends of parent horizontals

      i←@ 
      i↩{ (1+𝕩/m/↕≠p)⌾(𝕩⊸/) 𝕩 }˘m⊸/˘d=⌜˜↕⌈´d+1          # depth matrix to parent vector offset by 1 since null values are 0
      i↩∾˘(↕≠i) {«⍟𝕨 𝕩} ˘i                        # shift diagonal zeros to vertical line


      n↩(<2)‿(<2)/i
      n↩ {«𝕩∧2|↕≠𝕩}˘0¨⌾((2|↕≠n)⊸/) n
      n↩ {(vert⊸+)⌾((0<𝕩)⊸/)𝕩}˘n # consider ch to be anything over vert

      h↩(<2)‿(<2)/par⌈+`˘s-e                            # extend parents to horizontal with expanded padding
      h↩h∧¬{𝕩>«𝕩}˘h                                     # remove overflow hendings (ie o- nodes)
      h↩«0¨⌾((2|↕≠h)⊸/) h                               # bars on every second level and shift up
      h↩horz×0⊸< h                                 # set base for bars
      h↩h⌈(start×>⟜»˘h)+(end×>⟜«˘h)           # find start and end bars
      h↩h⌈mid×«0<n                                   # find mid bars that have children
      h↩h⌊vert                                     # clamp to vertical bar if both start and end

      {•Out ⊢◶(" ─┬├┐│"∾ch)¨𝕩}˘h⌈n                          # convert ids to characters and print
    }¨⍷r
}
