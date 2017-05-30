//https://en.wikibooks.org/wiki/LaTeX/Mathematics
//http://asy.marris.fr/asymptote/


// this is for gsview single-instance mode
import settings;
interactiveView=false;
batchView=false;

// drawing properties
size(8cm);
outformat="svg";
import graph;

real Eta = 1;
real Vt = 0.026;

real maxCurrent = 1.4e-3;
int magnify = 500;

real Is1 = 9.748e-9;
real Is2 = 4.448e-12;
real Is3 = 2.03e-15;

real maxV1 = Eta*Vt*log((maxCurrent+Is1)/Is1);
real maxV2 = Eta*Vt*log((maxCurrent+Is2)/Is2);
real maxV3 = Eta*Vt*log((maxCurrent+Is3)/Is3);
real maxV = max(maxV1, maxV2, maxV3);

xaxis( Label("$v$", align=N, fontsize(8pt)), Ticks(new real[]{0.3, 0.5, 0.7}), Arrow, xmax=maxV*1.1);
yaxis( Label("$i, A \times 500$", align=E, fontsize(8pt)), Arrow);

real f1(real x) {return magnify*(Is1*(exp(x/(Eta*Vt))-1));}
real f2(real x) {return magnify*(Is2*(exp(x/(Eta*Vt))-1));}
real f3(real x) {return magnify*(Is3*(exp(x/(Eta*Vt))-1));}

path mA = (0, 0.001*magnify) -- (maxV, 0.001*magnify);
path g1 = graph(f1, 0, maxV1, operator ..);
path g2 = graph(f2, 0, maxV2, operator ..);
path g3 = graph(f3, 0, maxV3, operator ..);
draw(mA, grey);

draw(g3, blue);
draw(g2, green);
draw(g1, red);

label("$1 mA$", (0, 0.001*magnify), align=W);
dot((0.3, 0.001*magnify), red);
label("$I_S = 9.75 \times 10^{-9}$", (0.3, 0.001*magnify), align=2S+1.8W, fontsize(8pt)+red);
dot((0.5, 0.001*magnify), green);
label("$4.45 \times 10^{-12}$", (0.5, 0.001*magnify), align=2S+1.8W, fontsize(8pt)+green);
dot((0.7, 0.001*magnify), blue);
label("$2.03 \times 10^{-15}$", (0.7, 0.001*magnify), align=2S+1.8W, fontsize(8pt)+blue);
