% script_ode45_template
%
%Constants

%
% solving equations
L = zeros(890, 2);
i=1;
len = zeros(2,1);
time = zeros(890,1);
for Kc = [-1 -10]
    fhandle = @(t,Y)Problem_1_function(t,Y, Kc); % function handle
    tfinal = 60; % in minutes
    tspan = [0 tfinal*60]; % start and stop time for the simulation
    Y0 = [1.0 2]; % vector of initial conditions
    [t,Y] = ode45(fhandle,tspan,Y0);
    %
    % Any extra manipulation
    %
    Fout = Y(:,1);
    len(i,1) = length(Y(:,2));
    time(1:len(i,1),i) = t;
    L(1:len(i,1),i) = Y(:,2);
    figure
    plot(t, Fout)
    hold on
    plot(t,L(1:len(i,1),i))
    xlabel('Time (min)')
    legend('Fout (kg/s)', 'Height(m)','Location', 'east')
    text = 'Kc = ' + string(Kc);
    title(text)
    i=i+1;
    filename = 'Kc_' + string(Kc) + '.png';
    saveas(gcf, filename)
end
figure
plot(time(1:len(1,1),1),L(1:len(1,1),1));
hold on
plot(time(1:len(2,1),2),L(1:len(2,1),2));
xlabel('Time (min)')
ylabel('Height (m)')
legend('Kc = -1', 'Kc = -10','Location', 'eastoutside')
saveas(gcf, 'time_vs_height.png')