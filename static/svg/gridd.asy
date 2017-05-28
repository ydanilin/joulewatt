//https://en.wikibooks.org/wiki/LaTeX/Mathematics
//http://asy.marris.fr/asymptote/
//http://www.piprime.fr/files/asymptote/modules/graph_pi.asy.html


// this is for gsview single-instance mode
import settings;
interactiveView=false;
batchView=false;

// drawing properties
size(10cm, 10cm);
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

grid();
