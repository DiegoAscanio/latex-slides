% -----------------------------------------------------------------------------
% Modelo de apresentação de trabalho acadêmico
% Projeto hospedado em: https://github.com/cfgnunes/latex-slides
%
% Autor: Cristiano Nunes <cfgnunes@gmail.com>
% -----------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{latex-slides}[2019/12/19 v0.1]

% Repassa os parâmetros ao beamer
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}

\ProcessOptions\relax
\LoadClass{beamer}

% -----------------------------------------------------------------------------
% Configurações gerais
% -----------------------------------------------------------------------------
\usetheme{default}                          % Tema
\usecolortheme{seagull}                     % Cores
\setbeamertemplate{footline}[frame number]  % Rodapé
\setbeamertemplate{section in toc}[square]  % Símbolos do sumário
\setbeamertemplate{itemize items}[circle]   % Símbolos das listas de itens
\setbeamertemplate{enumerate items}[circle] % Símbolos das listas enumeradas
\setbeamertemplate{itemize subitem}{{\textendash}}
\setbeamerfont{itemize/enumerate subbody}{shape=\itshape}
\setbeamertemplate{headline}{}              % Faixa superior desativada
\beamertemplatenavigationsymbolsempty       % Desabilita os botões de navegação

% Define margens
\setbeamersize{text margin left=2em,text margin right=2em}

% Ajusta as margens para o itemize
\setlength{\leftmargini}{10pt}

% Ajusta o espaçamento entre os itens de uma lista
\let\OLDitemize\itemize
\renewcommand\itemize{\OLDitemize\addtolength{\itemsep}{1em}}

% -----------------------------------------------------------------------------
% Cores
% -----------------------------------------------------------------------------
\setbeamercolor*{palette primary}{use=structure,fg=white,bg=structure.fg}
\setbeamercolor*{palette secondary}{use=structure,fg=white,bg=structure.fg!75}
\setbeamercolor*{palette tertiary}{use=structure,fg=white,bg=structure.fg!50!black}
\setbeamercolor*{palette quaternary}{fg=white,bg=black}

% -----------------------------------------------------------------------------
% Capa
% -----------------------------------------------------------------------------
\setbeamerfont{title}{size=\large,series=\bfseries,parent=structure}
\setbeamerfont{author}{size=\normalsize,parent=structure}
\setbeamerfont{date}{size=\scriptsize,parent=structure}

% -----------------------------------------------------------------------------
% Títulos
% -----------------------------------------------------------------------------
\setbeamercolor{frametitle}{bg=black,fg=white}
\setbeamerfont{frametitle}{series=\bfseries,size=\LARGE}
\setbeamertemplate{frametitle}{%
    \nointerlineskip
    \begin{beamercolorbox}[sep=0.2cm,ht=1.6em,wd=\paperwidth]{frametitle}
        \vbox{}\vskip-2ex%
        \strut\insertframetitle\strut
        \vskip-0.5ex%
    \end{beamercolorbox}
}

% -----------------------------------------------------------------------------
% Novos ambientes
% -----------------------------------------------------------------------------
\newtheorem{defn}{Defini\c c\~ao}
\newtheorem{teo}[theorem]{Teorema}
\newtheorem{ex}[theorem]{Exemplo}
