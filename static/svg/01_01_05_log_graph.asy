//https://en.wikibooks.org/wiki/LaTeX/Mathematics
//http://asy.marris.fr/asymptote/
//https://atom.io/packages/atom-shell-commands
//https://github.com/skywind3000/atom-shell-commands/issues/10


// this is for gsview single-instance mode
import settings;
interactiveView=false;
batchView=false;

// drawing properties
size(12cm);
outformat="svg";
import graph;

real XMin = 0.005;
real XMax = 6.5;
real YMin = -9;
real YMax = 1.4;

real Vt = 0.026;
real Is = 9.748e-9;

real f1(real x) {return Is*(exp(x/(2*Vt))-1);}
real f2(real x) {return Is*(exp(x/(1.67*Vt))-1);}
real f3(real x) {return Is*(exp(x/(1*Vt))-1);}

//write(f2(0.4));

ticks xticks = RightTicks(Label("", fontsize(8pt), Fill(white)), NoZero, Step=0.1, step=0);
ticks yticks = LeftTicks(Label("", fontsize(8pt)), N=1, n=1);
xaxis( Label("$v_D$", align=N, fontsize(8pt)), ticks=xticks, xmin=XMin, xmax=XMax, Arrow);
yaxis( Label("$i_D$", align=E, fontsize(8pt)), ticks=yticks, ymin=YMin, ymax=YMax, Arrow);

// grid
draw(box((XMin,YMin),(XMax,YMax)),invisible);
xaxis(BottomTop, XMin, XMax,
      Ticks("%", extend=true, Step=0.1, step=0, pTick=grey),
      p=nullpen);
yaxis(LeftRight, YMin, YMax,
      Ticks("%", extend=true, N=1, n=1, pTick=grey),
      p=nullpen);

// scale is after coordinate system definition
scale(Linear(10), Log);
path g1 = graph(f1, XMin, 0.55);
path g2 = graph(f2, XMin, 0.55);
path g3 = graph(f3, XMin, 0.55);

draw(g1, blue);
draw(g2, red);
draw(g3, green);

label("$\eta = 1$", (5, log10(3)), align=W, fontsize(8pt)+green, Fill(white));
label("$\eta = 1.67$", (5, log10(0.0015)), align=W, fontsize(8pt)+red, Fill(white));
label("$\eta = 2$", (4.8, log10(0.000065)), align=E, fontsize(8pt)+blue, Fill(white));
