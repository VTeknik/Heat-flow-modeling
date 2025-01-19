clear all
clc
close all

fig1 = figure(1);
clf(fig1)
ax1 = axes('position',[0.08  0.1  0.86  0.81],'Visible','on');
set (fig1, 'Units', 'normalized', 'Position', [0.1  0.13  0.95  0.77]);
axis('square')

% Q0 - heat flow at the surface. Units in mW/m/m.
% Qm -heat flow at the base. Units in mW/m/m.
% k - coefficient of thermal conductivity.
% Units in W/m/K.
% T0 - temperature at the surface. Units in degrees Celsius.
% Tc - temperature at the Curie depth points. Units in degrees Celsius.
% T0 - temperature at the surface. Units in degrees Celsius.
% Yc - Depth to Curie depth points. Units in degrees Celsius.
% H0 - Thus H0 is the surface (y = 0) radiogenic heat production rate per unit mass,
% hr - is a length scale for the decrease in H with depth.
% r- density kg/m3
% T - Tepmrature at depth
% Y - Depth, positive to downward

% Temprature of surfce based on meteorological records are the best source for local climate
% Tavmin and Tavmax is average annual min and max temprature
% Ref : https://weather-and-climate.com/average-monthly-min-max-Temperature,tehran-ir,Iran
% The average annual maximum temperature is: 
Tavmax = 22.0;
% The average annual minimum temperature is: 11.0° Celsius (51.8° Fahrenheit)
Tavmin = 11.0;
T0 = 3 + (Tavmin+Tavmax)/2;

% Ref : Geodynamic Turccote
% a typical geotherm in the continental crust computed from Equation (4.31) with
%  Q0 = 56.5 mW m?2, Qm = 30 mW m?2,
% hr = 10 km, and k = 3.0 W m?1 K?1.
hr = 10; k = 3; r =2800;
Qm = 30;Q0 = 56.5;
Tc = 580; %Curie point temprature
 
     D =  [0     50 100 150 200 250 300 350 400 450 500 550 600]; % distance from begining of profile
     N =  {'0Z' '50Z' '100Z' '150Z' '200Z' '250S' '300B' '350C' '400C' '450C' '500SC' '550SC' '600SC'}; % distance from begining of profile
   Yc =  [40.5 41 43  47   54    55  45   46   57   48  27   32   40  ]; % the CDP at location of D points
Q0_p =  [60  59  57  52  47.5   46 55   53   45   51  83  75    62 ]; % Q0 based on Fig3 of pollac and chapman 1977
   L_p = [115 115 120 140 145 135 140 125 160 142 73 82 115  ]; % litho thickness based on Fig3 of pollac and chapman 1977
%    plot(D, L_p)
   Tc (1,1:length(Yc)) =  [580]; % Cdp temperature
   Tl (1,1:length(Yc)) =  [1300]; % Lithosphere temperature
   T0 (1,1:length(Yc)) =  [T0];
   Y = 0:0.2:200; % range of Y axis
   T = 0:100:1400; % range of X-axis
   
% Plot Curie depth points
p1 = plot (Tc,Yc,'s','MarkerSize',6,'MarkerEdgeColor','r','MarkerFaceColor','b');
grid on
box on 
hold on
% text(Tc,Yc, N, 'FontWeight','bold','FontSize',8,'BackgroundColor', 'none', 'Margin',0.1,'Clipping', 'off');
p2 = plot (Tl,L_p,'s','MarkerSize',10,'MarkerEdgeColor','g','MarkerFaceColor','r');
%%
% Q0_i = [30 40 50 80 120 150]; % Q0 initial for ploting theroical ishoterms based on my improved formulation which
% % is derieved by using CDP depth
% %calculate Qm based derived Q0 from the Fig3 of pollac and chapman 1977
% for i =1: length(Q0_i)
% Qm_i = 0.535 * Q0_i(i);
% T = T0(1)  +  (Q0_i(i)/k)*Y  +  ((Q0_i(i) - Qm_i)*hr/k) * (1 - exp(-Y/hr));
% plot(T, Y , '-b', 'LineWidth',1);
% text(T(find(T==1200)) ,Y(find(T==1200)) , ['Q0 = ' num2str(D(i))], 'FontWeight','bold');
% end
% typical geotherm in the continental crust computed
T = T0(1)  +  (Qm/k)*Y  +  ((Q0 - Qm)*hr/k) * (1 - exp(-Y/hr));
p3 = plot(T, Y , '-r', 'LineWidth',3);
% plot continetal geotherms based on pollack and chapman 1977 parameters
% and for a range of Q0
% Q0 = 30;
% for i =1:8
%     Qm = Q0*6/10;
% T = T0(1)  +  (Qm/k)*Y  +  ((Q0 - Qm)*hr/k) * (1 - exp(-Y/hr));
%  T = T(T<=1400); Y = Y(T<=1400); % For putting text in the end of line
% p5 = plot(T, Y , '-b', 'LineWidth',2);
% text(T(end), Y(end), num2str(Q0), 'FontWeight','bold','BackgroundColor', 'b', 'Margin',0.2,'Clipping', 'off');
% Q0 = Q0 + 10;
% end
%--------------------------------------------------------

 for i=1:length(Tc)
     Ti = [T0(i) Tc(i) Tl(i)]; % three points for drawing geotherms
     Yi = [ 0   Yc(i)  L_p(i)];
     p4 = plot([Ti 1400] , [Yi interp1(Ti,Yi,1400,'linear','extrap') ], '--k','LineWidth',1.0);
     %---------------------------------------------------------------------------
  end
 xt = 700; % first position for label of lines
 for i=1:length(Tc)
     Ti = [T0(i) Tc(i) Tl(i)]; % three points for drawing geotherms
     Yi = [ 0   Yc(i)  L_p(i)];
% Display the text
 %X-position of label
text(xt, interp1(Ti,Yi,xt,'linear','extrap'), N(i), 'FontWeight','bold','BackgroundColor', 'g', 'Margin',0.2);
xt = xt+50;
% 'BackgroundColor', 'w', 'rotation', a);
%---------------------------------------------------------------
 end
 
 
 Namelist = { ' The numbers is distance(km) from beginning of the profile' ;'Z : Zagros'; ' S : Sanandaj-Sirjan Zone'; 'B : Bijar Basin';'C : Central Iran'; 'SC : South Caspian Basin'};
annotation('textbox',[0.45 0.11 0.26 0.24],'String',Namelist,...
    'FontSize',12,'FontName','Times','LineStyle','none','EdgeColor',[1 0 0],'LineWidth',1,...
    'BackgroundColor','non','Color',[0.1 0.1 0]);

 
 % Add LB and CDP vertical lines
line([580 580],[0 200],'Color','red','LineStyle','-', 'LineWidth',1);
text(565 ,190 , 'Curie Temperature (580 C)','Rotation' , 90,'FontSize',12, 'FontWeight','bold');
line([1300 1300],[0 200],'Color','red','LineStyle','-', 'LineWidth',1);
text(1285 ,60 , 'LAB (1300 C)','Rotation' , 90,'FontSize',12, 'FontWeight','bold');



% ploting Generalized solidus curves for peridotite based on Fig8 of
% pollack 1993
load Solidus3_pollac1997.txt;
S3 = Solidus3_pollac1997; % Generalized solidus curves for peridotite based on Fig
p6 = plot(S3(:,2) , S3(:,3), 'Color',[0.8 0.8 0.8],'LineWidth',2);
text(S3(2,2)+12 ,S3(2,3) , 'Hydrous','Rotation' , -110,'FontSize',12, 'FontWeight','bold');

load Solidus2_pollac1997.txt;
S2 = Solidus2_pollac1997; % Generalized solidus curves for peridotite based on Fig
p7 = plot(S2(:,2) , S2(:,3), 'Color',[0.8 0.8 0.8],'LineWidth',2);
text(S2(2,2)+12 ,S2(2,3) , 'Mixed volatile','Rotation' , -80,'FontSize',12, 'FontWeight','bold');

load Solidus1_pollac1997.txt;
S1 = Solidus1_pollac1997; % Generalized solidus curves for peridotite based on Fig
p8 = plot(S1(:,2) , S1(:,3), 'Color',[0.8 0.8 0.8],'LineWidth',2);
text(S1(2,2)+12 ,S1(2,3) , 'Dry Solidus','Rotation' , -55,'FontSize',12, 'FontWeight','bold');
%======================================
% Load Pollack 1997 geotherms for different Q0
Tin= { '40' '50' '60' '90'};
for i = 1: 4
    N =char(strcat('T' ,Tin(i),'.txt')); % Name of file of difrent geotherms that should be downloaded
N= load (N);
NX = N(:,2); NY = N(:,3); 
Di = 0:5:1400;
Ii = pchip(NX,NY,Di); % Piecewise Cubic Hermite Interpolating Polynomial
% plot(NX,NY,'o','MarkerSize',6,'MarkerEdgeColor','k','MarkerFaceColor','r')
p9 = plot(Di,Ii,'-b','LineWidth',1.5);
Di = Di(Di<=1400); Ii = Ii(Ii <=200); Di = Di(Ii <=200);% For putting text in the end of line
 text(Di(end), Ii(end), Tin(i), 'FontSize',12,'FontWeight','bold','Color','k','BackgroundColor', 'b', 'Margin',0.3,'Clipping', 'off');
end 


%======================================

ylabel('Depth (km)','FontSize',12,'FontWeight','bold','Color','r')
xlabel('Temperature (C)','FontSize',12,'FontWeight','bold','Color','r')
ax = gca;
ax.Color = 'white';
ax.FontSize = 13;                     % make the text larger
ax.FontWeight = 'bold';               % make the text bold
axis ij
ax.XAxisLocation = 'top';
ylim([0 200])
xlim([0 1400])
% hold off

%--------------------- legend part of figure-------------
l1 = legend([p1,p2,p3,p4,p9],'CDP from Susc model','Thermal LAB from fig3 of pollac and chapman 1977 ',...
    sprintf('Typical geotherm in the continental crust computed \n Q0 = 56.5 mWm-2  Qm = 30 mW m-2 \n hr = 10 km, and k = 3.0 W m-1 K-1.')...
    ,'Computed geotherms based on CDP and LAB',...
    'Pollack 1997 geotherms for different Q0','location','west');
l1.FontSize = 10;                     % make the text larger
l1.FontWeight = 'bold';               % make the text bold
%------------------------------------------------------------
hold off
%% ---------------------------------------------------------
% Convert temperature values from degrees Celsius to Kelvin.
T0 = T0 + 273.15;
Tc = Tc + 273.15;
 k=2; % we want to investigate the effect of defrent value k on ratio of mean(Qm_p)/mean(Q0_p)
for kk =1:5
    
  %calculate Qm based derived Q0 from the Fig3 of pollac and chapman 1977
for i =1: 1:length(Yc)
a =  (Yc(i)/k)  -  ( (hr/k) * (1- exp(-Yc(i)/hr)) );
b = (hr/k) * (1- exp(-Yc(i)/hr));
c = Tc(i) -T0(i);
%Qm based derived Q0 from the Fig3 of pollac and chapman 1977
Qm_p(i) = (c/a)  -  ((b/a)*Q0_p(i));
end
Q0_pm(kk) = mean(Q0_p);
Qm_pm(kk) = mean(Qm_p);
R(kk) = mean(Qm_p(kk))/mean(Q0_p(kk));
ki(kk) =k;
k=k+0.5;
end
% typical geotherm in the continental crust computed
% T = T0  +  (Qm/k)*Y  +  ((Q0 - Qm)*hr/k) * (1 - exp(-Y/hr));
% The surface heat flow q0 = ?q(y = 0) is obtained by setting y = 0 with the result
% Q0 = Qm + r*hr*H0;

ax2 = axes('position',[0.12  0.18  0.12 0.22],'Visible','on');
axis('square')

plot (ki,R,'--s','MarkerSize',8,'MarkerEdgeColor','k','MarkerFaceColor','b')
ax2.TickDir = 'in';ax2.XGrid = 'on';ax2.YGrid = 'on';
ylabel(ax2,'Avg(Qm/Q0)','FontSize',12,'FontWeight','bold','Color','k')
xlabel(ax2,'Thermal conductivity(W/m/K)','FontSize',12,'FontWeight','bold','Color','k')
ax2.Color = [0.98 0.98 0.98];
ax2.FontSize = 10;                     % make the text larger
ax2.FontWeight = 'bold';               % make the text bold
ylim(ax2,[0.2 1])
xlim(ax2,[1.5 4.5])
% % %------------------------------------------------------------------
ax3 = axes('position',[0.28  0.18  0.12 0.22],'Visible','on');
axis('square')

h1 = histogram(L_p);
hold on 
% xticks([20:20:60 50:50:200])
h2 = histogram(Yc);
ax3.TickDir = 'in';ax3.XGrid = 'on';ax3.YGrid = 'on';
legend on
xlabel(ax3,'Depth (km)','FontSize',12,'FontWeight','bold','Color','k')
ax3.Color = [0.98 0.98 0.98];
ax3.FontSize = 10;                     % make the text larger
ax3.FontWeight = 'bold';               % make the text bold
xticks([0:50:200])
xticklabels({'0','50','100','150','200'})
% ylim(ax3,[0.2 1])
% xlim(ax3,[1.5 4.5])
l2 = legend([h1,h2],'LAB','CDP','Location','northwest');
l2.FontSize = 10;                     % make the text larger
l2.FontWeight = 'bold';               % make the text bold

set(gcf, 'PaperPosition', [0 0 35 18]); %Position the plot further to the left and down. Extend the plot to fill entire paper.
set(gcf, 'PaperSize', [35 18]); %Keep the same paper size
saveas(gcf, 'geotherm', 'pdf')