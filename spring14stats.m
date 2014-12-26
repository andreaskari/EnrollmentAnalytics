function [probavail14,avg14,std14] = spring14stats(spring14data,spring14limit)
a = find(spring14limit-spring14data<5);
b = find(spring14data);
limits = [a(1),b(1)+104];

figure
%plotting enrollment and enrollment cap
subplot(2,1,1)
l14 = limits(1):limits(2);
plot(l14,spring14data(l14),l14,spring14limit(l14),'r:')
title('Registration for Math 54 during Spring 2014 After Almost Full')
xlabel('time (days)');ylabel('students')
legend('Enrollment','Limit','location','best')
axis([limits(1),limits(2),350,550])

%plotting remaining seats
subplot(2,1,2)
r14 = spring14limit(l14)-spring14data(l14);
avg14 = mean(r14); %average number or available seats
%interpolating using 'nearest' because it's a discreet function
nearest14 = interp1(l14,r14,limits(1):0.01:limits(2),'nearest');
plot(limits(1):0.01:limits(2),nearest14,'g',l14,l14*0+avg14,'r--')
xlabel('time (days)');ylabel('seats remaining')
legend('remaining seats',['avg remaining seats: ',num2str(avg14)],'location','best')
axis([limits(1),limits(2),0,max(r14)])

%probability data
std14 = std(r14);
probavail14 = numel(find(r14))/numel(r14);

disp(['After reaching less than 5 seats available, there are on average '...
    , num2str(avg14), ' seats available for Spring 2014, with a standard deviation of '...
    , num2str(std14), '.  There is a ', num2str(100*probavail14)...
    , '% chance of a seat being open on any given day.'])