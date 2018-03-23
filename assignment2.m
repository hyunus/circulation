%initialize model with values from literature
c = Circulation(75, 2.0, 0.06);
[time, state] = c.simulate(10);

% %question 2
figure
hold on
title('Ventricular, Atrial, and Aortic Pressures')
ylabel('Pressure')
xlabel('Time (s)')
plot(time, state(:,1), 'r');
plot(time, state(:,2), 'g');
%use ohm's law
plot(time, state(:,4)*c.R4, 'c')
legend('Ventricular', 'Atrial', 'Aortic')

%question 3
%todo: what should initial condition (x(4)) equal?
volume = getVolume(c, state, time, 20);
plot(time, volume);
function volume = getVolume(c, state, time, v0)
    temp = [];
    for i = 1:numel(time)
        temp(i) = state(i, 1)/c.elastance(time(i)) + v0;
    end
    volume = temp;
end
