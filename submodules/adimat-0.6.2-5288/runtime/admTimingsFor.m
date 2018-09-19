function [times, factors, diffs, types] = admTimingsFor(handle, varargin)

  lastArg = varargin{end};
  if isstruct(lastArg) && isfield(lastArg, 'admopts')
    adopts = lastArg;
    funcArgs = varargin(1:end-1);
  else
    adopts = admOptions;
    funcArgs = varargin;
  end

  adopts.x_types = struct('name', {'fun', 'For/O', 'For/D', 'For/V', ...
                      'VFor', 'VFor/V', 'FD', 'FD/V', ...
                   }, ...
                          'desc', 'unknown', ...
                          'time', nan, ...
                          'res', [], ...
                          'jac', [], ...
                          'hess', [], ...
                          'isvec', false ...
                          );


  [times, factors, diffs, types] = admGetTimings(handle, funcArgs{:}, adopts);

% $Id: admTimingsFor.m 4251 2014-05-18 20:25:07Z willkomm $