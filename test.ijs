load 'markov.ijs'

M1 =: 0.1 * _5 ]\ 3 0 7 0 0  4 1 2 2 1  6 0 4 0 0  10 0 0 0 0  0 0 0 0 10
M2 =: 0.0+_3 ]\ 1r5 0 4r5 2r7 3r7 2r7 1r3 4r9 2r9

NB. markov chain matrix representing state of adoption match.
NB. M_ij :
w =: * (=<:)"0/~ @ i.             NB. p if i+1=j
a =: <:@*: = i.@,~                NB. 1 if i=j=n
l =: -.@[ * 1 (|.!.0) 0=]|i.@,~@] NB. 1-p if j=0, i<n
m =: w + l + a@]                  NB. sum of the above
M =: m >:                         NB. m with proper dimensions

G =: conew'markov'
create__G (<'example'),(<M1)
draw__G ''

H =: conew'markov'
create__H (<'Urns'),(<M2),<;:'RED WHITE BLUE'
draw__H''

A =: conew'markov'
create__A (<'adoption'),(<0.75 M 10),(<(<'DADA'),~(<@":)"0 ] i.10)
draw__A''
