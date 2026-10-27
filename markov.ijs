dotviz =: 3 : 0
 'S C M N'=. y
 G=. 'digraph {',LF,'rankdir=LR;node[shape=circle]',LF
 for_uv. 4 $. $. M do.
  p =. M {~ < 'u v' =. uv
  echo uv;p
  G=. G,'  ',(u{::S),'->',(v{::S)
  G=. G,'[label="',(0j2":p),'"'
  G=. G,',penwidth=',(":2+p),',color="',(0j3":0.15+0.5*p),' 1.0 0.8"];',LF
 end. G=. G,'}',LF
 G 1!:2 < N,'.dot'
 2!:0 'dot -Tsvg ',N,'.dot -o ',N,'.svg'
)

M =: 0.1 * _5 ]\ 3 0 7 0 0  4 1 2 2 1  6 0 4 0 0  10 0 0 0 0  0 0 0 0 10
NB. M =: _3 ]\ 1r5 0 4r5 2r7 3r7 2r7 1r3 4r9 2r9
labv =: 'red';'white';'blue'
]labv =: <;._2 '1 2 3 4 5 '

dotviz (<labv),a:,(<0.0+M),<'Problem5'
