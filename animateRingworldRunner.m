function animateRingworldRunner(t, final_positions)
    for i = 1:length(t)
       hold on
       position_data = final_positions(i, :);
       graphing_data = create_frame(position_data);
       for point = 1:length(graphing_data(1,:))
           plot(graphing_data(1,point), graphing_data(1,point))
           plot(0, 0, '.r')
       end
       drawnow;
    end
end

function current_positions = create_frame(positions)
    for i = 1:length(positions)
        %Separates the X and Y data, and rearranges it in the correct
        %format to make it wasier to plot it all
        if mod(i, 2) == 0; %Detects even or odd numbers
            current_positions(1, i) = positions(i);
        else
            current_positions(2, i) = positions(i);
        end    
    end
end