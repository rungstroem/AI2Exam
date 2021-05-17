n = 500;
k = 4;
alpha = 0.05;

%% For reward func 2
agent1_2 =      [128 132 117 132 145 134 129 131 146 142]
rd1_2 = 		[125 125 125 117 125 112 131 123 122 116]
rd2_2 = 		[125 121 127 137 122 122 119 141 116 124]
rd3_2 = 		[122 122 131 114 108 132 121 105 116 118]

%% Statistics
sPsA1 = agent1_2/500;
sPsR1 = rd1_2/500;
sPsR2 = rd2_2/500;
sPsR3 = rd3_2/500;

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