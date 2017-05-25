import graph_pi;
import patterns;
usepackage("mathrsfs");
usepackage("icomma");

size(10cm,0);

graphicrules(xunit=1cm, yunit=8cm,
             xmin=-1, xmax=8,
             ymin=-.2, ymax=1.2,
             crop=Crop
             );
// Définition et tracé de la grille
grid(xStep=1, xstep=.5,
     yStep=.2, ystep=.1,
     pTick=.7bp+.7white, 
     ptick=.7bp+dotted+.7white,
     above=false
     );
// Définition et tracé des axes
cartesianaxis(
    xticks=Ticks(Label(Fill(white)),
                 Step=1, step=.5,
                 NoZero,
				 ptick=grey),
    yticks=Ticks(Label(Fill(white)),
                 Step=.2, step=.1,
                 NoZero,
                 ptick=grey),
    Arrow
    );
// Définition de la fonction
real f(real x) {return 1/x^2;}
 
// Les rectangles
int a=1, b=8;
for(int i=a; i <= b; ++i) {
  if(i < b) filldraw(box((i,f(i)),(i+1,0)),lightgray);
  dot((i,f(i)));
} 
// Les hachures.
path zonehachuree=buildcycle((8,1)--(8,0)--(1,0)--(1,1),graph(f,1,8));
add("hachure",hatch(H=3mm,dir=NE,red));
fill(zonehachuree,pattern("hachure"));

// Tracé de courbe
path Cf=graph(f,.5,8,n=400);
draw(Cf,linewidth(1bp)+blue);
xlimits(-1.5,8.5,Crop);
ylimits(-.3,1.3,Crop);
label("$\mathscr{C}_f : y=\displaystyle\frac{1}{x^2}$",(1,f(1)),NE);  

labeloij(p=1.4bp+.5*red,
         arrow=Arrow(SimpleHead,8bp),
         dot
         );
		 
arrow("$\displaystyle\int_{1}^{+\infty}\left(\frac{1}{x^2}\right)$d$x=1$",
	  (3.5,0.05),NE,1.5cm,red,Margin(0,0.5));
arrow("$\displaystyle\sum_{k=1}^{+\infty}\left(\frac{1}{k^2}\right)
	   =\frac{\pi^2}{6}$",(1.5,0.8),E,1.5cm,blue,Margin(0,0.5));	  