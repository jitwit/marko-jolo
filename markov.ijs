coclass 'markov'

NB. instantiating
create =: 3 : 0
 NB. y should be a boxed array of arguments. the first argument is the
 NB. target file name, the argument is the marikov transition matrix
 NB. P, and the optional third is a potential labeling, defaulting to
 NB. 1+i.#P
 select. #y
 case. 2 do.
  L =: (<@":)"0 ] 1+i.#M [ 'out M' =: y
 case. 3 do.
  'out M L' =: y
 case. do. 'bad arguments'
 end.
)

NB. analyzing markov chains
NB. finding closed classes (cliques)
CQ =: {{ if. 1=#~.c=.y{~I.x{y do. <I.{.c else. a: end. }}
NB. recurrent classes of markov chain
REC =: {{ a:-.~G CQ~"_ 0 I.~:G=.(+./ . *.&y)^:_ y=.y+.=/~i.#y=.y>0 }}
NB. computing stationary distribution (for a given class, must be
NB. aperiodic and irreducible)
PI =: ((1,~0#~_1+#) %. 1,~ [: }: |:-=@i.@#)

NB. drawing
draw =: 3 : 0
 NB. draw using graphviz
 G=. 'digraph {',LF,'rankdir=LR;node[shape=circle,style=filled,colorscheme="set39",fontname="CMU Concrete, Rockwell, Courier"]',LF

 for_c. C=.REC M do. c=.>c
  PI_c =: PI c{c{"1 M NB. transition chain for class c

  G=. G,'  subgraph cluster_',(":c_index),' {',LF
  G=. G,'  style=rounded;label="π = ',(0j2":PI_c),'";',LF
  
  for_v. c do.
   G=. G,'  "',(v{::L),'" [fillcolor=',(":1+c_index),'];',LF
  end.
  G =. G,' }',LF
 end.

 for_t. (i.#M)-.;C do.
  G=. G,'  "',(t{::L),'" [fillcolor="9"];',LF
 end.
 
 for_uv. 4 $. $. M do.
  p =. M {~ < 'u v' =. uv
  G=. G,'  "',(u{::L),'"->"',(v{::L),'"'
  G=. G,'[label="',(0j2":p),'"'
  G=. G,',penwidth=',(":2+p),',color="',(0j3":0.5+0.5*p),' 1.0 0.8"];',LF
 end. G=. G,'}',LF
 G 1!:2 < out,'.dot'
 2!:0 'dot -Tsvg ',out,'.dot -o ',out,'.svg'
 out,'.svg'
)
