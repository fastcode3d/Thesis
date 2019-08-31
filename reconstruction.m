  function patch_and_show( vertices, color, cells )
% PATCH AND SAVE - Function that performs triangle filling and
%                  shading using patch and saves resulting plot
%                  using export_fig
%
% SYNTAX
%
%   patch_and_save
%
% INPUT
%
%   n           sequence number                         [  1  ]
%
% OUTPUT
%
%   void
%
% DESCRIPTION
%
%   patch_and_save implements a filling algorithm
%   and save the resulting plot, it reads the coordinates,
%   and color from txt files
%       position_n.txt
%       color_n.txt
%       cells_n.txt
%
% DEPENDENCIES
%
%   patch
%   export_fig
%

  %% PARAMETERS
  addpath('./mesh2pdf_2.0/')
  N = 53149;
  n_cells = 105694;
  basepath = './DATASET/';

   a = vertices;
%    x = cell2mat(a);
   vertices = double(reshape(a, N, 3)).';

   a = color;
%    x = cell2mat(a);
   color = double(reshape(a, N, 3)).';
%    size(color)
   a = cells;
%    x = cell2mat(a);
   cells = double(reshape(a, n_cells, 3)).';

  %% PATCH
  X = zeros(3, n_cells);
  Y = zeros(3, n_cells);
  Z = zeros(3, n_cells);
  C = ones(3, n_cells, 3);

  for i=1:1:n_cells
      X(:, i) = vertices(1, cells(:,i)+1);
      Y(:, i) = vertices(2, cells(:,i)+1);
      Z(:, i) = vertices(3, cells(:,i)+1);
      C(:, i, :) = color(:, cells(:,i)+1).';
  end

  %% EXPORT FIG
  close all
  figure('Position', [-1 -1 350 350])
  patch(X, Y, Z, C, 'edgecolor','none');
  axis('tight', 'equal')
  axis off


%  filename = sprintf('image_%d', 5);
%  f = [basepath 'matlab' filesep filename '.png'];
%  export_fig(f);
end

%%------------------------------------------------------------
%
% AUTHORS
%
%   Anastasia Pachni Tsitiridou          aipachni@ece.auth.gr
%
% VERSION
%
%   0.1 - June 27, 2019
%
% CHANGELOG
%
%   0.1 (Jun 27, 2019) - Anastasia