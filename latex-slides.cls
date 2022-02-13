% ------------------------------------------------------------------------------
% Modelo de apresentação de trabalho acadêmico
% Projeto hospedado em: https://github.com/cfgnunes/latex-slides
%
% Autor: Cristiano Nunes <cfgnunes@gmail.com>
% Data: 2019-12-18
% ------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{latex-slides}[2022/02/12 v0.2]

% Captura a opção 'faixa_superior' para imprimir inserir a faixa de seções
\providecommand{\flagfaixasuperior}{false}
\DeclareOption{faixa_superior}{
    \renewcommand{\flagfaixasuperior}{true}
}

% Repassa os parâmetros ao beamer
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}

\ProcessOptions\relax
\LoadClass{beamer}

% ------------------------------------------------------------------------------
% Configurações gerais
% ------------------------------------------------------------------------------
\usetheme{default}                          % Tema
\usecolortheme{seagull}                     % Cores
\setbeamertemplate{section in toc}[square]  % Símbolos do sumário
\setbeamertemplate{itemize items}[circle]   % Símbolos das listas de itens
\setbeamertemplate{enumerate items}[circle] % Símbolos das listas enumeradas
\setbeamertemplate{itemize subitem}{{\textendash}}
\setbeamerfont{itemize/enumerate subbody}{shape=\itshape}
\beamertemplatenavigationsymbolsempty       % Desabilita os botões de navegação

% Configura lista de referências bibliográficas
\setbeamertemplate{bibliography item}{$\bullet$ }

\let\OLDthebibliography\thebibliography
\renewcommand\thebibliography[1]{
    \OLDthebibliography{#1}
    \setlength{\parskip}{0pt}
    \setlength{\itemsep}{5pt plus 0.3ex}
}

% Define margens
\setbeamersize{text margin left=1cm,text margin right=1cm}

% Ajusta as margens para o itemize
\setlength{\leftmargini}{10pt}

% Ajusta o espaçamento entre os itens de uma lista
\let\OLDitemize\itemize
\renewcommand\itemize{\OLDitemize\addtolength{\itemsep}{1.5em}}

% ------------------------------------------------------------------------------
% Cores
% ------------------------------------------------------------------------------
\setbeamercolor*{palette primary}{use=structure,fg=white,bg=structure.fg}
\setbeamercolor*{palette secondary}{use=structure,fg=white,bg=structure.fg!75}
\setbeamercolor*{palette tertiary}{use=structure,fg=white,bg=structure.fg!50!black}
\setbeamercolor*{palette quaternary}{fg=white,bg=black}

% ------------------------------------------------------------------------------
% Capa
% ------------------------------------------------------------------------------
\setbeamerfont{title}{size=\large,series=\bfseries,parent=structure}
\setbeamerfont{author}{size=\normalsize,parent=structure}
\setbeamerfont{date}{size=\scriptsize,parent=structure}

% ------------------------------------------------------------------------------
% Faixa superior
% ------------------------------------------------------------------------------
\setbeamertemplate{headline}{%
    \ifthenelse{\equal{\flagfaixasuperior}{true}}{%
        \leavevmode%
        \hbox{%
            \begin{beamercolorbox}[wd=\paperwidth,ht=2.5ex,dp=1.2ex]{palette quaternary}%
                \insertsectionnavigationhorizontal{\paperwidth}{}{}%
            \end{beamercolorbox}%
        }
        \vspace{-1.0pt}
    }{}%
}

% ------------------------------------------------------------------------------
% Títulos
% ------------------------------------------------------------------------------
\setbeamercolor{frametitle}{bg=black,fg=white}
\setbeamerfont{frametitle}{series=\bfseries,size=\LARGE}
\setbeamertemplate{frametitle}{%
    \nointerlineskip
    \begin{beamercolorbox}[wd=\paperwidth,ht=1.6em,sep=0.2cm]{frametitle}%
        \vbox{}\vskip-2ex%
        \strut\insertframetitle\strut
        \vskip-0.5ex%
    \end{beamercolorbox}
}

% ------------------------------------------------------------------------------
% Rodapé
% ------------------------------------------------------------------------------
\setbeamercolor{footline}{fg=gray}
\setbeamertemplate{footline}{%
    \hfill%
    \usebeamercolor[fg]{page number in head/foot}%
    \usebeamerfont{page number in head/foot}%
    \setbeamertemplate{page number in head/foot}[framenumber]%
    \usebeamertemplate*{page number in head/foot}\kern1em\vskip1em%
}

% ------------------------------------------------------------------------------
% Novos ambientes
% ------------------------------------------------------------------------------
\newtheorem{defn}{Defini\c c\~ao}
\newtheorem{teo}[theorem]{Teorema}
\newtheorem{ex}[theorem]{Exemplo}
