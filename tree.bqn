# draw tree in unicode

Draw⇐{
    d←(⊢∾1+⊏⟜⥊)´⌽p←𝕩                                     # p: parent vector, d: depth vector
    w←{b𝕊a: ∾⍟(1-˜≡) {𝕩∾¨𝕩⊏b⊔˜b⊏p}⌾((a∊b⊏p)⊸/)a}´⌽d⊔↕≠p  # order depths depending on parent groups
    n←{𝕩∧1+w⊏p}˘(1+⌈´d)↑w=⌜w⊏d                           # matrix of ordered depth path cut off
    n↩(0≠∨˝n)⊸/˘n↩>(↕≠)⊸({«⍟𝕨 𝕩}˘)n                      # shift columns under parent node and remove empty space
    s←0<∊⊸∧˘n⋄e←0<(⌽∘∊∘⌽)⊸∧˘n⋄h←s{+`𝕨-𝕩}˘e⋄m←0<h∧n⋄v←s∧e # s: start, e: ends, h: horizontals, m: middles, v: verticals 
    b←" ─┬├┐│"⊏˜(0⥊˜≠⍉n)∾1↓⌈´h‿m‿s‿e‿v×¨1+↕5             # branches - nullify root layer. 1: horizontal, 2: middle, 3: start, 4: end, 5: vertical, 
    o←∾˘(0⊸≢)◶" "‿"·"¨n                                  # convert nodes to characters
    •Out˘b{𝕨∾(@+10)∾𝕩}˘o                                 # combine branches and nodes and print
  }
