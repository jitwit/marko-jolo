coclass 'markov'

NB. analyzing markov chains

NB. finding closed classes (cliques)
C =: {{ if. 1=#~.c=.y{~I.x{y do. <I.{.c else. a: end. }}
NB. recurrent classes of markov chain
R =: {{ a:-.~G C~"_ 0 I.~:G=.(+./ . *.&y)^:_ y=.y+.=/~i.#y=.y>0 }}

NB. instantiating
create =: 3 : 0
 NB. y should be a boxed array of arguments. the first argument is the
 NB. marikov transition matrix P, the second is the target file name,
 NB. and the optional third is a potential labeling, defaulting to
 NB. 1+i.#P
 select. #y
 case. 2 do.
  'M out' =: y
  L =: (<@":)"0 ] 1+i.#M
 case. 3 do.
  'M out L' =: y
 case. do. 'bad arguments'
 end. 1
)

NB. drawing
draw =: 3 : 0
 NB. draw using graphviz
NB. 'S C M N'=. y
 G=. 'digraph {',LF,'rankdir=LR;node[shape=circle]',LF
 for_uv. 4 $. $. M do.
  p =. M {~ < 'u v' =. uv
  G=. G,'  ',(u{::L),'->',(v{::L)
  G=. G,'[label="',(0j2":p),'"'
  G=. G,',penwidth=',(":2+p),',color="',(0j3":0.5+0.5*p),' 1.0 0.8"];',LF
 end. G=. G,'}',LF
 G 1!:2 < out,'.dot'
 2!:0 'dot -Tsvg ',out,'.dot -o ',out,'.svg'
)
