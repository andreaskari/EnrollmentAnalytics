function [ClassData] = ExtractData(UnextractedData)
%EXTRACTDATA Summary of this function goes here
%   Detailed explanation goes here
ClassData = struct();

CellData = strsplit(strrep(UnextractedData,'%2C',char(10)));
j=1;
Enrollment = zeros((length(CellData))/3,1);
Limit = Enrollment;
Waitlist = Enrollment;
for i=1:3:length(CellData)
    Enrollment(j) = str2double(CellData{i});
    Limit(j) = str2double(CellData{i+1});
    Junk = CellData{i+2};
    Waitlist(j) = str2double(Junk(1:find(Junk == '%', 1)-1)); 
    j=j+1;
end
start = find(Enrollment ~= 0, 1) - 1;

ClassData.Enrollment = Enrollment(start:min(start+105, length(Enrollment)));
ClassData.Limit = Limit(start:min(start+105, length(Enrollment)));
ClassData.Waitlist = Waitlist(start:min(start+105, length(Enrollment)));
ClassData.AvailableSeats = ClassData.Limit - ClassData.Enrollment;
end

