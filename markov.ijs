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
 DOT=. 'digraph {',LF,'rankdir=LR;node[shape=circle,style=filled'
 DOT=. DOT,',colorscheme="set39",fontname="CMU Concrete, Rockwell, Courier"]',LF

 for_c. C=.REC M do. c=.>c
  PI_c =: PI c{c{"1 M NB. transition chain for class c

  DOT=. DOT,'  subgraph cluster_',(":c_index),' {',LF
  DOT=. DOT,'  style=rounded;label="π = ',(0j2":PI_c),'";',LF
  
  for_v. c do.
   DOT=. DOT,'  "',(v{::L),'" [fillcolor=',(":(c_index>:1)+1+c_index),'];',LF
  end.
  DOT =. DOT,' }',LF
 end.

 for_t. (i.#M)-.;C do.
  DOT=. DOT,'  "',(t{::L),'" [fillcolor="2"];',LF
 end.
 
 for_uv. 4 $. $. M do.
  p =. M {~ < 'u v' =. uv
  DOT=. DOT,'  "',(u{::L),'"->"',(v{::L),'"'
  DOT=. DOT,'[label="',(0j2":p),'"'
  DOT=. DOT,',penwidth=',(":2+p^3),',color="',(0j3":0.38+0.62*p),' 0.69 0.84"];',LF
 end. DOT=. DOT,'}',LF
 DOT 1!:2 < out,'.dot'
 2!:0 'dot -Tsvg ',out,'.dot -o ',out,'.svg'
 out,'.svg'
)
