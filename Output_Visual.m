% 1. Setup Serial Port
arduinoPort = serialport("COM3", 9600); 
configureTerminator(arduinoPort, "LF"); 
flush(arduinoPort); 

% Constants for calculation
Vcc = 5;
R_fixed = 10000; % 10k Ohm resistor
maxPoints = 100; % Number of data points to show on screen at once

% 2. Initialize Tracking Counters
timeCounter = 0;

% 3. Setup Figure Window
figureHandle = figure('Name', 'LDR Real-Time Dual Analytics', 'NumberTitle', 'off');
clf;

% --- Voltage Graph ---
subplot(2, 1, 1); % 2 rows, 1 column, graph #1
lineVoltLeft  = animatedline('Color', 'b', 'LineWidth', 2, 'DisplayName', 'Left V');
lineVoltRight = animatedline('Color', 'r', 'LineWidth', 2, 'DisplayName', 'Right V');
ylabel('Voltage (V)');
title('Real-Time Sensor Voltages');
ylim([0, 5.2]); % Pin the voltage axis between 0V and 5V
grid on;
legend('Location', 'northwest');

% --- Resistance Graph ---
subplot(2, 1, 2);
lineResLeft  = animatedline('Color', 'b', 'LineWidth', 2, 'DisplayName', 'Left LDR');
lineResRight = animatedline('Color', 'r', 'LineWidth', 2, 'DisplayName', 'Right LDR');
xlabel('Time / Data Points');
ylabel('Resistance (Ohms)');
title('Real-Time LDR Resistances');
grid on;
legend('Location', 'northwest');

disp('Plotting live voltage and resistance charts... Close the window to stop.');

% 4. Main Processing Loop
while ishandle(figureHandle) 
    try
        rawData = readline(arduinoPort);
        dataArray = str2double(split(rawData, ","));
        
        if numel(dataArray) == 2
            % Accept the voltages directly from Arduino
            Vout_L = dataArray(1);
            Vout_R = dataArray(2);
            
            % Calculate Resistances (with dark-threshold safety checks)
            if Vout_L > 0.05
                R_LDR_Left = ((R_fixed * Vcc) / Vout_L) - R_fixed;
            else
                R_LDR_Left = 1000000; % Cap at 1M if dark
            end
            
            if Vout_R > 0.05
                R_LDR_Right = ((R_fixed * Vcc) / Vout_R) - R_fixed;
            else
                R_LDR_Right = 100000; 
            end
            
            % Increment time step
            timeCounter = timeCounter + 1;
            
            % Update Top Graph (Voltages)
            addpoints(lineVoltLeft, timeCounter, Vout_L);
            addpoints(lineVoltRight, timeCounter, Vout_R);
            
            % Update Bottom Graph (Resistances)
            addpoints(lineResLeft, timeCounter, R_LDR_Left);
            addpoints(lineResRight, timeCounter, R_LDR_Right);
            
            % Scroll the x-axis for BOTH subplots simultaneously
            for g = 1:2
                subplot(2, 1, g);
                if timeCounter > maxPoints
                    xlim([timeCounter - maxPoints, timeCounter]);
                else
                    xlim([1, maxPoints]);
                end
            end
            
            % Render all updates to screen immediately
            drawnow;
            
        end
    catch
        break; 
    end
end

% 5. Safe Clean Up
clear arduinoPort;
disp('Data stream stopped.');














