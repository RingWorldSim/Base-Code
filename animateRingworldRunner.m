function animateRingworldRunner(t, final_positions)
    for i = 1:length(t)
       clf
       hold on
       position_data = final_positions(i, :);
       graphing_data = create_frame(position_data);
       for point = 1:length(graphing_data(1,:))
           plot(graphing_data(1,point), graphing_data(2,point), '.b')
           plot(0, 0, '.r')
       end
       text(0, 0 , int2str(i))
       drawnow;
    end
end

function graphing_data = create_frame(positions)
    graphing_data = zeros(2, length(positions(1,:)));
    counter = 1;
    for i = 1:length(positions)
        %Separates the X and Y data, and rearranges it in the correct
        %format to make it easier to plot it all
        if mod(i, 2) == 0; %Detects even or odd numbers
            graphing_data(2, counter) = positions(i);
            counter = counter + 1;
        else
            graphing_data(1, counter) = positions(i);
        end    
    end
end