function pf_plot_weights(X, w, state);

% the number of particles
M = size(X, 2);

% normalize the weights
w = (w - min(w)) / (max(w) - min(w));

% remove any NaN's
w(isnan(w)) = 0;

% sort the weights so that we can plot them based upon probability
[t inds] = sort(w);

% plot each point
figure(2)
myPFmap
hold on
c = [w(inds)', 0*w(inds)', 0*w(inds)'];
scatter(X(1, inds), X(2, inds), 20, c, 'filled');
plot(state(1), state(2), 'ko', 'MarkerSize', 8, ...
     'MarkerEdgeColor', [0 1 1], 'MarkerFaceColor', [0 1 1]);
myPFmap
hold off
drawnow
