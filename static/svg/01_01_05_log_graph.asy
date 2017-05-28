//https://en.wikibooks.org/wiki/LaTeX/Mathematics
//http://asy.marris.fr/asymptote/
//https://atom.io/packages/atom-shell-commands
//https://github.com/skywind3000/atom-shell-commands/issues/10


// this is for gsview single-instance mode
import settings;
interactiveView=false;
batchView=false;

// drawing properties
size(10cm);
//outformat="svg";
import graph;

void grid(picture pic=currentpicture,
          real xmin=pic.userMin().x, real xmax=pic.userMax().x,
          real ymin=pic.userMin().y, real ymax=pic.userMax().y,
          real xStep=1, real xstep=.5,
          real yStep=1, real ystep=.5,
          pen pTick=nullpen, pen ptick=grey, bool above=false)
{
  draw(pic,box((xmin,ymin),(xmax,ymax)),invisible);
  xaxis(pic, BottomTop, xmin, xmax,
        Ticks("%",extend=true,Step=xStep,step=xstep,pTick=pTick,ptick=ptick),
        above=above, p=nullpen);
  yaxis(pic, LeftRight, ymin, ymax,
        Ticks("%",extend=true,Step=yStep,step=ystep,pTick=pTick,ptick=ptick),
        above=above, p=nullpen);
}

grid(xStep=1, xstep=1,
     yStep=1, ystep=1,
     pTick=.8red,
     ptick=dotted+.7bp+.4white,
     above=false
     );

real Vt = 0.026;
real Is = 9.748e-9;

real f1(real x) {return Is*(exp(x/(2*Vt))+1);}
real f2(real x) {return Is*(exp(x/(1.6*Vt))+1);}
real f3(real x) {return Is*(exp(x/(1*Vt))+1);}

ticks xticks = RightTicks(Label("", fontsize(8pt)), NoZero, Step=0.1, step=0);
ticks yticks = LeftTicks(Label("", fontsize(8pt)), N=1, n=1);

xaxis( Label("$v_D$", align=N, fontsize(8pt)), ticks=xticks, xmin=0, xmax=6.5, Arrow);
yaxis( Label("$i_D$", align=E, fontsize(8pt)), ticks=yticks, ymin=-8, ymax=1.8, Arrow);

scale(Linear(10), Log);
path g1 = graph(f1, 0, 0.55);
path g2 = graph(f2, 0, 0.55);
path g3 = graph(f3, 0, 0.55);

draw(g1, blue);
draw(g2, red);
draw(g3, green);
