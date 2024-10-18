[num,txt,raw] = xlsread('Data mean std.xlsx');

for i=1:size(num,1)
    mean(i)=num(i,1);
    stddev(i)=num(i,2);
    age(i)=num(i,3);
end

for i=1:size(num,1)
    for j=1:size(num,1)
mu1 =mean(i);       % Mean of curve 1
sigma1 =stddev(i);    % Standard deviation of curve 1

% Parameters for the second curve
mu2 = mean(j);       % Mean of curve 2
sigma2 = stddev(j);  % Standard deviation of curve 2

% Define the range for x values
x = linspace(-500, 500, 100000);

% Define the Gaussian functions
curve1 = (1/(sigma1 * sqrt(2*pi))) * exp(-0.5 * ((x - mu1) / sigma1).^2);
curve2 = (1/(sigma2 * sqrt(2*pi))) * exp(-0.5 * ((x - mu2) / sigma2).^2);

% Calculate the area between the two curves
area_between(i,j) = trapz(x, abs(curve1 - curve2));
    end
end

for i=1:size(num,1)
    common(i)=0;
    different(i)=0;
    for j=1:size(num,1)
       if age(i)==age(j) 
           common(i)=common(i)+area_between(i,j);
       else
            different(i)=different(i)+area_between(i,j);
       end
    end
end


