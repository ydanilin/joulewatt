//https://en.wikibooks.org/wiki/LaTeX/Mathematics
//http://asy.marris.fr/asymptote/
//https://atom.io/packages/atom-shell-commands
//https://github.com/skywind3000/atom-shell-commands/issues/10


// this is for gsview single-instance mode
import settings;
interactiveView=false;
batchView=false;

// drawing properties
size(8cm);
outformat="svg";
import graph;

real XMin = -0.3;
real XMax = 0.06;
real YMin = -1.25e-10;
real YMax = 1.25e-10;
real XStep = 0.04;
real xstep = 0;
real YStep = 0;
real ystep = 0;
real xScale = 1;
real yScale = ((XMax-XMin)/(YMax-YMin))*0.85;
//real yScale = 1;

real Vt = 0.026;
real Is = 1e-10;
real eta = 2;

real f1(real x) {return Is*(exp(x/(eta*Vt))-1);}

// grid
draw(box((XMin*xScale, YMin*yScale),(XMax*xScale, YMax*yScale)), invisible);
xaxis(BottomTop, XMin*xScale, XMax*xScale,
      Ticks("%", extend=true, Step=XStep, step=xstep, pTick=grey),
      p=nullpen);
real[] hujhuj = {-1e-10, -0.75e-10, -0.5e-10, -0.25e-10, 0.25e-10, 0.5e-10, 0.75e-10, 1e-10};
yaxis(LeftRight, YMin*yScale, YMax*yScale,
      Ticks("%", extend=true, Ticks=hujhuj, pTick=grey),
      p=nullpen);

ticks xticks = RightTicks(Label("%.4g", fontsize(8pt), Fill(white)), Step=XStep, step=xstep, pTick=black, NoZero);
real[] huj = {-1e-10, 1e-10};
ticks yticks = Ticks(Label("%.4g", fontsize(8pt), align=0.3*N+1*W, Fill(white)), Ticks=huj, pTick=black, Size=1mm);
xaxis(Label("$v_D$", align=N, fontsize(8pt)), ticks=xticks, xmin=XMin*xScale, xmax=XMax*xScale, above=true, Arrow);
yaxis(Label("$i_D$", align=E, fontsize(8pt)), ticks=yticks, ymin=YMin*yScale, ymax=YMax*yScale, above=true, Arrow);


// scale is after coordinate system definition
scale(Linear(xScale), Linear(yScale));
path g1 = graph(f1, XMin, 0.04);

draw(g1, red);
