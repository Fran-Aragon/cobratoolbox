function initialAssignment = Model_getInitialAssignmentBySymbol(SBMLModel, symbol)
%
%   Model_getInitialAssignmentBySymbol 
%             takes  1) an SBMLModel structure 
%             and    2) a string representing the symbol of the initialAssignment to be found
%
%             and returns 
%               the initialAssignment structure with the matching symbol 
%               or an empty structure if no such initialAssignment exists
%               
%       initialAssignment = Model_getInitialAssignmentBySymbol(SBMLModel, 'symbol')

%  Filename    :   Model_getInitialAssignmentBySymbol.m
%  Description :
%  Author(s)   :   SBML Development Group <sbml-team@caltech.edu>
%  $Id: Model_getInitialAssignmentBySymbol.m 7155 2008-06-26 20:24:00Z mhucka $
%  $Source v $
%
%<!---------------------------------------------------------------------------
% This file is part of SBMLToolbox.  Please visit http://sbml.org for more
% information about SBML, and the latest version of SBMLToolbox.
%
% Copyright 2005-2007 California Institute of Technology.
% Copyright 2002-2005 California Institute of Technology and
%                     Japan Science and Technology Corporation.
% 
% This library is free software; you can redistribute it and/or modify it
% under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation.  A copy of the license agreement is provided
% in the file named "LICENSE.txt" included with this software distribution.
% and also available online as http://sbml.org/software/sbmltoolbox/license.html
%----------------------------------------------------------------------- -->



% check that input is correct
if (~isSBML_Model(SBMLModel))
    error(sprintf('%s\n%s', 'Model_getInitialAssignmentBySymbol(SBMLModel, symbol)', 'first argument must be an SBML model structure'));
elseif (~ischar(symbol))
    error(sprintf('%s\n%s', 'Model_getInitialAssignmentBySymbol(SBMLModel, symbol)', 'second argument must be a string'));
elseif (SBMLModel.SBML_level ~= 2)
    error(sprintf('%s\n%s', 'Model_getInitialAssignmentBySymbol(SBMLModel, symbol)', 'no symbol field in a level 1 model'));   
end;

initialAssignment = [];

for i = 1:length(SBMLModel.initialAssignment)
    if (strcmp(symbol, SBMLModel.initialAssignment(i).symbol))
        initialAssignment = SBMLModel.initialAssignment(i);
        return;
    end;
end;