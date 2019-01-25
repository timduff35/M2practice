-- getting started
x=1+1
(x+x)%3
y
class x
ancestors x
help Thing
viewHelp Thing
restart
x

-- twisted cubic
FF = QQ
R = FF[x_0..x_3]
S = FF[s, t]
phi = map(S, R, 
    {s^3, s^2*t, s*t^2, t^3}
    )
I = ker phi
dim I -- why?

isPrime I
gb I
G = gens oo
entries G
flatten entries G
L = oo
J = ideal take(L, 2)
isPrime J
primaryDecomposition J

-- free resolutions of homogeneous ideals
FR = res I
K = koszul (gens I)
FR.dd

-- precedence
I1 = ideal x_0^2 + x_1^2;
I2 = ideal(x_0^2 + x_1^2);
I1 == I2

-- prime vs primary
primaryDecomposition I1
minimalPrimes I1
decompose I1
help decompose
isPrime I2
f = (gens I2)_(0,0)
factor f

-- base ring matters
isPrime I2
R' = (ZZ/101)[gens R]
phi=map(R', R)
isPrime phi I2

-- local computations
R=QQ[x,y,MonomialOrder=>{Weights=>{-1,-1},2},Global=>false]
I = ideal(x^3-3*x*y^2, 3*x^2*y-y^3)
F = x^2019 + y^2019 + x*y
H = F // gens I
r = F%I
(gens I)*H
assert(oo_(0,0) + r == F)
dim I
Q = R/I
M = basis Q -- mult_0(I)=??
m = multiplicity I
promote(F,Q)
F_Q

-- functions, loops, scope, 
-- objects, methods, ...
a = 2019
fac = n -> (
    a = 1;
    for i from 2 to n do a = a * i;
    a
    )
fac 5
a -- bad...

-- G = (V, E)
Graph = new Type of HashTable 
ancestors Graph

-- "constructors"
graph = method()
graph (List, List) := (V, E) -> (
    new Graph from {Vertices => V, 
	Edges => E}
    )
graph Matrix := M -> (
    n := numcols M -1;
    V := toList(0..n);
    E := for i from 0 to n list(
  	for j from 0 to n list(
	    x := M_(i,j);
	    if (x == 1) then (i,j)
	    else if (x =!= 0) then error(
		"adjacency matrix not binary"
		)
	    )
	);
    graph(V, delete(null, flatten E))
    )

graph({A,B,C}, {(A,B),(B,C)})
graph({"not", "check"}, {"input"})
graph matrix{{0,1,1},
    {1,0,0},
    {1,0,0}}

-- PACKAGES
apropos "ackage"
help "needsPackage"

needsPackage "NumericalAlgebraicGeometry"
R = CC[x,y]
f = random(31,R) + random CC
g = random(37,R) + random CC
I = ideal(f,g)
F = polySystem {f, g}
elapsedTime sols = solveSystem F;
#sols
netList sols
sols/status
tally oo