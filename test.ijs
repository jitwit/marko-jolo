load 'markov.ijs'

M =: 0.1 * _5 ]\ 3 0 7 0 0  4 1 2 2 1  6 0 4 0 0  10 0 0 0 0  0 0 0 0 10
NB. M =: _3 ]\ 1r5 0 4r5 2r7 3r7 2r7 1r3 4r9 2r9
labv =: 'red';'white';'blue'
]labv =: <;._2 '1 2 3 4 5 '

NB. dotviz (<labv),a:,(<0.0+M),<'Problem5'
NB. (<labv),a:,(<0.0+M),<'Problem5'

G =: conew'markov'
create__G (<0.0+M),(<'Problem5')
draw__G ''
