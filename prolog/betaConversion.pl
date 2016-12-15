/*************************************************************************

    File: betaConversion.pl
    Copyright (C) 2004,2005,2006 Patrick Blackburn & Johan Bos

    This file is part of BB1, version 1.3 (November 2006).

    BB1 is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    BB1 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with BB1; if not, write to the Free Software Foundation, Inc., 
    59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

*************************************************************************/

:- module(betaConversion,[betaConvert/2]).

:- use_module(alphaConversion,[alphaConvert/2,
                               alphabeticVariants/2]).


/*========================================================================
   Beta-Conversion (introducing stack)
========================================================================*/

betaConvert(X,Y):-
   betaConvert(X,Y,[]).


/*========================================================================
   Beta-Conversion (comment-in for tracing)
========================================================================*/

%betaConvert(X,_,S):-
%   nl, write('Expre: '), print(X),
%   nl, write('Stack: '), print(S), nl,
%   fail.


/*========================================================================
   Beta-Conversion (core stuff)
========================================================================*/

betaConvert(X,Y,[]):-
   var(X), !,
   Y=X.

betaConvert(Expression,Result,Stack):- 
   nonvar(Expression),
   Expression = app(Functor,Argument),
                                     %% To suppress alpha-conversion:
   alphaConvert(Functor,Converted),  %%   comment-out this line 
%   Functor=Converted,               %%   comment-in this line 

   betaConvert(Converted,Result,[Argument|Stack]), !.

betaConvert(Expression,Result,[X|Stack]):-
   nonvar(Expression),
   Expression = lam(X,Formula),
   betaConvert(Formula,Result,Stack), !.

betaConvert(Formula,Result,[]):-
   nonvar(Formula), !,
   Formula =.. [Functor|Formulas],
   betaConvertList(Formulas,ResultFormulas),
   Result =.. [Functor|ResultFormulas].

betaConvert(Exp,app(Exp,Y),[X]):-    %% Impossible to perform application.
   betaConvert(X,Y).


/*========================================================================
   Beta-Convert a list
========================================================================*/

betaConvertList([],[]).

betaConvertList([Formula|Others],[Result|ResultOthers]):-
   betaConvert(Formula,Result),
   betaConvertList(Others,ResultOthers).


