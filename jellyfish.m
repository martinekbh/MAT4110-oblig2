% Program compresses jellyfish image using SVD

% Convert the images to grey scale
% https://pixabay.com/en/board-chess-chessboard-black-white-157165/
im2 = rgb2gray(imread('jellyfish.jpg'));
% Convert to double between 0 and 1.
im2 = im2double(im2);

% Plot the image
figure;
fig = gca;
imshow(im2,'Parent', fig, 'InitialMagnification',50);
title(fig, "Jellyfish");

errors = [];
r_vals = linspace(1, 1, 1);
% Compress image
for i=1:length(r_vals)
    r = r_vals(i);
    [compr, sing_vals] = compress(im2, r);
    figure;
    comprfig = gca;
    image1 = imshow(compr, 'Parent', comprfig, 'InitialMagnification', 50);
    title(comprfig, "Jellyfish compressed");
    outerpos = comprfig.OuterPosition;
    ti = comprfig.TightInset; 
    left = outerpos(1) + ti(1);
    bottom = outerpos(2) + ti(2);
    ax_width = outerpos(3) - ti(1) - ti(3);
    ax_height = outerpos(4) - ti(2) - ti(4);
    comprfig.Position = [left bottom ax_width ax_height];
    saveas(comprfig, sprintf("jelly_compr_plot_r%d.png", r));
    error = relError(im2, compr);
    errors = [errors;error];
end

figure;
plot1 = gca;
plot(plot1, sing_vals);
title(plot1, "Singular values (jellyfish)");
ylabel("Log( sigma_i )");
xlabel("i (index)");
outerpos = plot1.OuterPosition;
ti = plot1.TightInset; 
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3);
ax_height = outerpos(4) - ti(2) - ti(4);
plot1.Position = [left bottom ax_width ax_height];
saveas(plot1, "singval_jelly_plot.png");
set(plot1, 'YScale', 'log');

figure;
plot2 = gca;
plot(plot2, r_vals,errors);
title(plot2, "Error (jelly)");
ylabel("error");
xlabel("r");
outerpos = plot2.OuterPosition;
ti = plot2.TightInset; 
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3);
ax_height = outerpos(4) - ti(2) - ti(4);
plot2.Position = [left bottom ax_width ax_height];
saveas(plot2, "error_jelly_plot.png");
set(plot2);

