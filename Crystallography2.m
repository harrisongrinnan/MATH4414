clc
clear
clear all
%Purpose: Graph atomic scattering factor for CsCl
% reference http://www-structure.11n1.gov/Xray/comp/scatfac.htm
%Cromer-Mann coefficients for Cs+ CHNO
% % % Cs+	55	20.3524	19.1278	10.2821	0.9615	3.552	0.3086	23.7128	59.4565	3.2791
%6	2.31	1.02	1.5886	0.865	20.8439	10.2075	0.5687	51.6512	0.2156


a= [2.31	1.02	1.5886	0.865];
b= [20.8439	10.2075	0.5687	51.6512];
c=0.2156
x=0:.001:.6;
f=0
for i=1:4
f = f + a(i)*exp(-b(i)*x.^2)
end
f = f + c
plot(x,f,'r','LineWidth',3)
ylim([0 55])
ylabel('f, electrons')
xlabel('sin\theta/\lambda, angstroms^-^1')
title('Atomic Scattering Curves CsCl ')
hold on
% % % Cl1-	17	18.2915	7.2084	6.5337	2.3386	0.0066	1.1717	19.5424	60.4486	-16.378
%1	0.493002	0.322912	0.140191	0.04081	10.5109	26.1257	3.14236	57.7997	0.003038

a= [0.493002	0.322912	0.140191	0.04081];
b= [10.5109	26.1257	3.14236	57.7997];
c=0.003038;
x=0:.001:.6;
f=0
for i=1:4
f = f + a(i)*exp(-b(i)*x.^2)
end
f = f + c
plot(x,f,'--','LineWidth',3)

%12.2126	3.1322	2.0125	1.1663	0.0057	9.8933	28.9975	0.5826	-11.529
%3.0485	2.2868	1.5463	0.867	13.2771	5.7011	0.3239	32.9089	0.2508


a= [12.2126	3.1322	2.0125	1.1663];
b= [0.0057	9.8933	28.9975	0.5826];
c=-11.529;
x=0:.001:.6;
f=0
for i=1:4
f = f + a(i)*exp(-b(i)*x.^2)
end
f = f + c
plot(x,f,'-','LineWidth',3)

a= [3.0485	2.2868	1.5463	0.867];
b= [13.2771	5.7011	0.3239	32.9089];
c=0.2508;
x=0:.001:.6;
f=0
for i=1:4
f = f + a(i)*exp(-b(i)*x.^2)
end
f = f + c
plot(x,f,'*','LineWidth',1)


legend('Carbon, C','Hydrogen, H','Nitrogen, N','Oxygen, O')

%web page for Cromer Mann ceof
%http://www.ruppweb.org/xray/comp/scatfac.htm