% Data
n = 500;
agent1 = [115 133 97 117 121 117 122 142 129 134];
agent2 = [128 132 117 132 145 134 129 131 146 142];

%% I have 10 samples of 500 datapoints. Of the 500 datapoints I have recorded wins.
% Prepare data - dataset of proportions

% Sample proportions - one proportion for each sample
sP1s = agent1/500;
sP2s = agent2/500;

% Sample variances - one for each sample
s1s = [];
s2s = [];
for i=1:10
    s1sTemp = sqrt(sP1s(i)*(1-sP1s(i))/n);
    s2sTemp = sqrt(sP2s(i)*(1-sP2s(i))/n);
    s1s = [s1s s1sTemp];
    s2s = [s2s s2sTemp];
end

%% The sample proportion distribution - distrubition of sample statics
N = 10;
pHat1 = mean(sP1s)
pHat2 = mean(sP2s)
pHat = (mean(sP1s)+mean(sP2s))/(N*2)

SE1 = sqrt(pHat1*(1-pHat1))
SE2 = sqrt(pHat2*(1-pHat2))

% Central limit theorem
% States that the sample proportion distribution is approximately normal. 
% Independence of observations - ie. the samples are randomly drawn...
% Each sample should have at least 10 successes and 10 failures n*p >=(10)
% and n*(1-p) >= 10

% Use pHat1 and pHat2 for mean of all proportions

%% Compare pHat1 and pHat2
% Hypothesis H0: Agent 1 wins more than agent 2 - ie. pHat1 > pHat2
% H1: pHat1 <= pHat2
alpha = 0.05;
z0 = (pHat2-pHat1)/sqrt(pHat*(1-pHat)*(1/N+1/N));
zAlpha = norminv(alpha,0,1)*-1
display("Accept H1?");
z0>zAlpha
% H0 is accepted. This means that agent 1 is more likely to win. 
% Just for a test, it proves the above.
ztest((pHat1-pHat2),sqrt(pHat*(1-pHat)*(1/N+1/N)), alpha);