%Chapter5StarterProgram
clc                   %clears content of command window
close all           %
clear                 %clears variables in workspace
%Script file:   Chapter 5Starter program
% 
% Purpose  Plot reciprocal cell superimposed on direct cell
%  
% Record of revisions:
%  Date             Programmer           Description of change
%  1 12            M. Julian            Original Code
%  4 17            M. Julian            reciprocal lattice
%
%  define variables:
%  a  = crystallographic a axis  (Angstroms)
%  b  = crystallographic b axis  (Angstroms)
%  c  = crystallographic c axis  (Angstroms)
%  alpha   angle between b and c  (degrees)
%  beta    angle between a and c  (degrees)
%  gamma   angle between a and b  (degrees)
%  conversion converts from triclinc to cartesian
% outline  outlines cell
% cc  cartesian coordinates (direct basis) = conversion*outline
% ccstar  cartesian coordinates (reciprocal basis) = conversion*outline
% astar, bstar, cstar reciprocal lattice vectors
% outline:  outline of unit cell
% G metric matrix; Gstar is G* 
% x, y, z, xx, yy, zz  shorthand for plotting
%alpha cristobalite
%DLLeucine
h=1
k=1
l=2    %max reflection hkl in PDF
a=8.469; 
b=9.727;
c=9.174;
alpha= 90;
beta = 92;
gamma= 90;
%chosen atom A for structure factor from cif
%C1 C -0.10810 -0.10890 0.44480
Ax=-0.8559
Ay=0.3765
Az=1.1076
%calculate G matrix
G=[a^2                a*b*cosd(gamma)   a*c*cosd(beta)
   a*b*cosd(gamma)    b^2               b*c*cosd(alpha)
   a*c*cosd(beta)      b*c*cosd(alpha)  c^2]
V=sqrt(det(G))
Gstar=inv(G)
Vstar=1/V
%%%%%%%%%%%%%%%%%%%calculation of d spacings for -1 1 0 reflection
astar=sqrt(Gstar(1,1))
bstar=sqrt(Gstar(2,2))
cstar=sqrt(Gstar(3,3))   
alphastar=acosd(Gstar(2,3)/(bstar*cstar))
betastar=acosd(Gstar(1,3)/(astar*cstar))
gammastar=acosd(Gstar(1,2)/(astar*bstar))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%calculation of d-spacing for highest order reflection
H2=['H' k l]*Gstar*[h k l]';
H=sqrt(H2);
d=1/H
%exponent for structure factor
expSF=-2*h*Ax-2*k*Ay-2*l*Az
f= figure(1);
dat =  {a,'    a*',astar
        b,'    b*',bstar 
        c,'    c*',cstar
        alpha,'    alpha*',alphastar
        beta,'    beta*',betastar
        gamma,'    gamma*',gammastar
        V,'    V*',Vstar};
cnames = {'Direct Lattice','','Reciprocal Lattice'};
rnames = {'a','b','c','alpha','beta','gamma','V'};
%t = uitable('Parent',f,'Data',dat,'ColumnName',cnames,... 
%            'RowName',rnames,'Position',[20 20 360 100]);
t = uitable('Parent',f,'Data',dat,'ColumnName',cnames,... 
            'RowName',rnames,'ColumnWidth',{75}); 
        
        %G and G star etc
f= figure(2);

newdat = {'O1' 'O' 0.8559  0.3765  1.1076
'N1' 'N' 0.9534  0.1888  0.9973
'N2' 'N' 0.4339  0.1244  1.1262
'C1' 'C' 0.9418  0.0442  0.9558
'C2' 'C' 1.0893 0.2652 0.9450
'C3' 'C' 0.8473  0.2533  1.0784
'C4' 'C' 0.7132  0.1696  1.1351
'C5' 'C' 0.7324 0.0810 1.2517
'C6' 'C' 0.6018 0.0151 1.3040
'C7' 'C' 0.4567 0.0393 1.2388
'C8' 'C' 0.5620 0.1874  1.0768
'H1' 'H' 0.831  0.068  1.296
'H2' 'H' 0.610  -0.048  1.385
'H3' 'H' 0.363  -0.003  1.273
'H4' 'H' 0.545  0.245  0.992
'H5' 'H' 0.832  0.012  0.967
'H6' 'H' 0.963  0.037  0.853
'H7' 'H' 1.102  0.255  0.838
'H8' 'H' 1.185 0.233  0.986
'H9' 'H' 1.080 0.359  0.959
'C1B' 'C' 1.0582 -0.0442 1.0442
'N1B' 'N' 1.0466 -0.1888 1.0027
'H5B' 'H' 1.168 -0.012 1.033
'H6B' 'H' 1.037 -0.037 1.147
'C2B' 'C' 0.9107 -0.2652 1.055
'C3B' 'C' 1.1527 -0.2533 0.9216
'H7B' 'H' 0.898 -0.255 1.162
'H8B' 'H' 0.815 -0.233 1.014
'H9B' 'H' 0.92 -0.359 1.041
'O1B' 'O' 1.1441 -0.3765 0.8924
'C4B' 'C' 1.2868 -0.1696 0.8649
'C5B' 'C' 1.2676 -0.081 0.7483
'C8B' 'C' 1.438 -0.1874 0.9232
'C6B' 'C' 1.3982 -0.0151 0.696
'H1B' 'H' 1.169 -0.068 0.704
'N2B' 'N' 1.5661 -0.1244 0.8738
'H4B' 'H' 1.455 -0.245 1.008
'C7B' 'C' 1.5433 -0.0393 0.7612
'H2B' 'H' 1.39 0.048 0.615
'H3B' 'H' 1.637 0.003 0.727};
cnames = {'Atoms','Element','X','Y', 'Z'};
rnames = {'G',' ',' ','Gstar',' ',' ','hkl','d','C1','expSF',};
%t = uitable('Parent',f,'Data',dat,... 
%            'RowName',rnames,'Position',[20 20 360 100]);
t = uitable('Parent',f,'Data',newdat,'ColumnName',cnames,...
           'ColumnWidth',{75}); 
t.Position(3)=t.Extent(3);
t.Position(4)=t.Extent(4);

%This is a scaling factor. You want to adjust it to be 1/cube root of the volume of YC.
figure(3)
s=V^(1/3);
a=a/s; 
b=b/s;
c=c/s;

%calculate G matrix
G=[a^2                a*b*cosd(gamma)   a*c*cosd(beta)
   a*b*cosd(gamma)    b^2               b*c*cosd(alpha)
   a*c*cosd(beta)      b*c*cosd(alpha)  c^2];


V=sqrt(det(G));
%convert to Cartesian
c1=c*cosd(beta);
c2=c*(cosd(alpha)-cosd(gamma)*cosd(beta))/sind(gamma);
c3=sqrt(c^2-c1^2 -c2^2);
conversion =[a b*cosd(gamma)   c1
             0 b*sind(gamma)   c2
             0 0               c3]
%%%%%%conversion = CartesianC(a, b, c, alpha, beta, gamma)%function
outline = [0 1 1 0 0 0 1 1 1 1 1 1 0 0 0 0
           0 0 1 1 0 0 0 0 0 1 1 1 1 1 1 0
           0 0 0 0 0 1 1 0 1 1 0 1 1 0 1 1];
cc= (conversion*outline)';
x=cc(:,1)';
y=cc(:,2)';
z=cc(:,3)';
plot3(x,y,z);
axis equal
axis off
%rescales axes  by 70%
axis([-.7*a  a+.7*a -.7*b  b+.7*b -.7*c  c+.7*c ])
hold on
%******************************************************8
% reciprocal cell
%Calculate G* from G
Gstar= inv(G);
%Use equation 5.23 in book to calculate vectors a*, b*, c*
astar=Gstar*[1 0 0]';
bstar=Gstar*[0 1 0]';
cstar=Gstar*[0 0 1]';
%create matrix of three reciprocal column vectors
star=[astar bstar cstar];
%now convert to cartesian and multiply by outline to create cell
ccc=(conversion*star*outline)';
xx=ccc(:,1)';
yy=ccc(:,2)';
zz=ccc(:,3)';
plot3(xx,yy,zz,'r');

 