n = 500;
k = 4;
alpha = 0.05;

%% For reward func 1
agent1_1 =      [115 133 97 117 121 117 122 142 129 134]
rd1_1 = 		[125 140 135 120 125 144 137 133 120 136]
rd2_1 = 		[143 106 142 150 116 124 112 122 119 112]
rd3_1 = 		[117 121 126 113 138 115 129 103 132 118]

%% Statistics
sPsA1 = agent1_1/500;
sPsR1 = rd1_1/500;
sPsR2 = rd2_1/500;
sPsR3 = rd3_1/500;

pHatA = mean(sPsA1);
pHat1 = mean(sPsR1);
pHat2 = mean(sPsR2);
pHat3 = mean(sPsR3);

%% Marascuillo procedure
% Compute differences 
pA1 = pHatA-pHat1;
pA2 = pHatA-pHat2;
pA3 = pHatA-pHat3;
p12 = pHat1-pHat2;
p13 = pHat1-pHat3;
p23 = pHat2-pHat3;

% Compute test statistic
rA1 = sqrt(chi2inv(alpha,k-1))*sqrt( (pHatA*(1-pHatA))/10 + (pHat1*(1-pHat1))/10 );
rA2 = sqrt(chi2inv(alpha,k-1))*sqrt( (pHatA*(1-pHatA))/10 + (pHat2*(1-pHat2))/10 );
rA3 = sqrt(chi2inv(alpha,k-1))*sqrt( (pHatA*(1-pHatA))/10 + (pHat3*(1-pHat3))/10 );
r12 = sqrt(chi2inv(alpha,k-1))*sqrt( (pHat1*(1-pHat1))/10 + (pHat2*(1-pHat2))/10 );
r13 = sqrt(chi2inv(alpha,k-1))*sqrt( (pHat1*(1-pHat1))/10 + (pHat3*(1-pHat3))/10 );
r23 = sqrt(chi2inv(alpha,k-1))*sqrt( (pHat2*(1-pHat2))/10 + (pHat3*(1-pHat3))/10 );

display("Significant difference between agent and random player 1")
pA1
rA1
pA1 > rA1

display("Significant difference between agent and random player 2")
pA2
rA2
pA2 > rA2

display("Significant difference between agent and random player 3")
pA3
rA3
pA3 > rA3