load 'markov.ijs'

M1 =: 0.1 * _5 ]\ 3 0 7 0 0  4 1 2 2 1  6 0 4 0 0  10 0 0 0 0  0 0 0 0 10
M2 =: 0.0+_3 ]\ 1r5 0 4r5 2r7 3r7 2r7 1r3 4r9 2r9

G =: conew'markov'
create__G (<'Problem5'),(<M1)
draw__G ''

H =: conew'markov'
create__H (<'Urns'),(<M2),<;:'RED WHITE BLUE'
draw__H''
