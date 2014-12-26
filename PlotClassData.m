function handle = PlotClassData(ClassData)


x = 1:length(ClassData.Enrollment);
handle = plot(x, ClassData.Enrollment, 'g',...
              x, ClassData.Limit, 'b',...
              x, ClassData.Waitlist, 'r');
legend('Enrollment', 'Limit', 'Waitlist', 'Location', 'Best');
xlabel('Days Since Telebears Phase I');
ylabel('People');

end

