function V = solveV(Ac,C,F,Q,R)

V = lyap(Ac.',Q+C.'*F.'*R*F*C);

end