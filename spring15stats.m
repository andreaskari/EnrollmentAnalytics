function [probavail15,avg15,std15] = spring15stats(spring15data, spring15limit)
a = find(spring15limit-spring15data<5);
limits = [a(1),numel(spring15data)];

figure
%plotting enrollment and enrollment cap
subplot(2,1,1)
l15 = limits(1):limits(2);
plot(l15,spring15data(l15),l15,spring15limit(l15),'r:')
title('Registration for Math 54 during Spring 2015 After Almost Full')
xlabel('time (days)');ylabel('students')
legend('Enrollment','Limit','location','sw')
axis([limits(1),limits(2),350,500])

subplot(2,1,2)
%plotting remaining seats
r15 = spring15limit(l15)-spring15data(l15);
avg15 = mean(r15); %average number or available seats
%interpolating using 'nearest' because it's a discreet function
nearest15 = interp1(l15,r15,limits(1):0.01:limits(2),'nearest');
plot(limits(1):0.01:limits(2),nearest15,'g',l15,l15*0+avg15,'r--')
xlabel('time (days)');ylabel('seats reamaining')
legend('remaining seats',['avg remaining seats: ',num2str(avg15)],'location','nw')
axis([limits(1),limits(2),0,max(r15)])

%probability data
std15 = std(r15);
probavail15 = numel(find(r15))/numel(r15);

disp(['After reaching less than 5 seats available, there are on average '...
    , num2str(avg15), ' seats available for Spring 2015, with a standard deviation of '...
    , num2str(std15), '.  There is a ', num2str(100*probavail15)...
    , '% chance of a seat being open on any given day.'])