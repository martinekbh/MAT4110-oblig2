% Program compresses chessboard image using SVD

% Convert the images to grey scale
% https://pixabay.com/en/board-chess-chessboard-black-white-157165/
im1 = rgb2gray(imread('chessboard.png'));
% Convert to double between 0 and 1.
im1 = im2double(im1);

% Plot the image
figure;
fig = gca;
imshow(im1,'Parent', fig, 'InitialMagnification',50);
title(fig, "Sjakkbrett");

errors = [];
% Compress image
for r=1:1:5
    [compr, sing_vals] = compress(im1, r);
    figure;
    comprfig = gca;
    image1 = imshow(compr, 'Parent', comprfig, 'InitialMagnification', 50);
    title(comprfig, "Chessboard compressed");
    outerpos = comprfig.OuterPosition;
    ti = comprfig.TightInset; 
    left = outerpos(1) + ti(1);
    bottom = outerpos(2) + ti(2);
    ax_width = outerpos(3) - ti(1) - ti(3);
    ax_height = outerpos(4) - ti(2) - ti(4);
    comprfig.Position = [left bottom ax_width ax_height];
    saveas(comprfig, sprintf("chess_compr_plot_r%d.png", r))
    error = relError(im1, compr);
    errors = [errors;error];
end

figure;
plot1 = gca;
plot(plot1, sing_vals);
title(plot1, "Singular values (chessboard)");
ylabel("Log( sigma_i )");
xlabel("i (index)")
outerpos = plot1.OuterPosition;
ti = plot1.TightInset; 
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3);
ax_height = outerpos(4) - ti(2) - ti(4);
plot1.Position = [left bottom ax_width ax_height];
saveas(plot1, "singval_chess_plot.png")
set(plot1, 'YScale', 'log');

figure;
plot2 = gca;
plot(plot2, errors);
title(plot2, "Error (chessboard)");
ylabel("error");
xlabel("r")
outerpos = plot2.OuterPosition;
ti = plot2.TightInset; 
left = outerpos(1) + ti(1);
bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3);
ax_height = outerpos(4) - ti(2) - ti(4);
plot2.Position = [left bottom ax_width ax_height];
saveas(plot2, "error_chess_plot.png")
set(plot2);



