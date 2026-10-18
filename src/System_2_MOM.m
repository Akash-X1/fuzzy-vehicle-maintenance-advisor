% System 2: MOM Defuzzification
M = mamfis('Name',"Advisor_MOM");
M.DefuzzificationMethod = 'mom'; 
M.AndMethod = 'min';

% Inputs
M = addInput(M,[0 1000],'Name',"mileage");
M = addMF(M,"mileage","trapmf",[0 0 200 400],'Name',"low");
M = addMF(M,"mileage","trimf",[300 500 700],'Name',"medium");
M = addMF(M,"mileage","trapmf",[600 800 1000 1000],'Name',"high");

M = addInput(M,[0 100],'Name',"coolant");
M = addMF(M,"coolant","trapmf",[0 0 20 40],'Name',"low");
M = addMF(M,"coolant","trimf",[30 50 70],'Name',"medium");
M = addMF(M,"coolant","trapmf",[60 80 100 100],'Name',"normal");

M = addInput(M,[0 36],'Name',"brakeAge");
M = addMF(M,"brakeAge","trapmf",[0 0 6 12],'Name',"new");
M = addMF(M,"brakeAge","trimf",[10 18 26],'Name',"aging");
M = addMF(M,"brakeAge","trapmf",[24 30 36 36],'Name',"old");

% Output
M = addOutput(M, [0 100],'Name',"urgency");
M = addMF(M,"urgency","trimf",[0 0 40],'Name',"low");
M = addMF(M,"urgency","trimf",[30 50 70],'Name',"medium");
M = addMF(M,"urgency","trapmf",[60 80 100 100],'Name',"high");


ruleList = [
    1 3 1 1 1 1; 
    2 3 2 2 1 1;
    0 1 0 3 1 1; 
    3 0 3 3 1 1; 
    2 2 1 2 1 1; 
    1 2 3 2 1 1; 
    1 3 3 2 1 1; 
    3 3 1 2 1 1; 
    2 2 2 2 1 1; 
    2 3 3 3 1 1; 
    2 3 1 1 1 1; 
];
M = addRule(M, ruleList);

%TEST VALUES
test_vals = [650, 35, 25]; 
result = evalfis(M, test_vals);
fprintf('\n--- System 2 (MOM Defuzzification) ---\n');
fprintf('Urgency Score: %.2f\n\n', result);

%VISUALIZATINS

% Figure 1
figure('Name','Test Values on Input MFs');
subplot(3,1,1); plotmf(M,'input',1); hold on; xline(test_vals(1), 'r', 'LineWidth', 2); title(['Mileage = ', num2str(test_vals(1))]);
subplot(3,1,2); plotmf(M,'input',2); hold on; xline(test_vals(2), 'r', 'LineWidth', 2); title(['Coolant = ', num2str(test_vals(2))]);
subplot(3,1,3); plotmf(M,'input',3); hold on; xline(test_vals(3), 'r', 'LineWidth', 2); title(['Brake Age = ', num2str(test_vals(3))]);

% Figure 2
figure('Name','System 2: Output & Surface');

% Output Graph 
subplot(2,1,1); 
plotmf(M,'output',1); 
hold on; 
xline(result, 'r', 'LineWidth', 2); 
title(['Output: Urgency = ', num2str(result)]); 

% 3D Surface Map
subplot(2,1,2); 
gensurf(M, [1 2], 1, [25 25], [NaN NaN test_vals(3)]);