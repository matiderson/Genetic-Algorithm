function f = Fitness(x, task_number)

assignin('base',"x",x);

if task_number == 1
    out = sim('Obiekt123.slx',[0 100]);
    f = out.ise.Data(end);
elseif task_number == 2
    out = sim('Obiekt123.slx',[0 100]);
    f = mean(out.absolute_error.Data(find(out.absolute_error.Time==20):end));
elseif task_number == 3
    out = sim('Obiekt123.slx',[0 100]);
    u_end = out.u.Data(end);
    isc = 0;
    for i=1:length(out.u.Data)-1
        isc = isc + (u_end - out.u.Data(i))^2 * (out.u.Time(i+1) - out.u.Time(i));
    end
    f = out.ise.Data(end) + isc;
else
    out = sim('Obiekt123_dyskretny.slx',[0 100]);
    f = mean(out.absolute_error.Data(find(out.absolute_error.Time==20):end));
end

end