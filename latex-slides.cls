% -----------------------------------------------------------------------------
% Modelo de apresentação de trabalho acadêmico
% Projeto hospedado em: https://github.com/cfgnunes/latex-slides
%
% Autor: Cristiano Fraga G. Nunes <cfgnunes@gmail.com>
% -----------------------------------------------------------------------------

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

% -----------------------------------------------------------------------------
% Configurações gerais
% -----------------------------------------------------------------------------
\usetheme{default}                          % Tema
\usecolortheme{seagull}                     % Cores
\setbeamertemplate{section in toc}[square]  % Símbolos do sumário
\setbeamertemplate{itemize items}[circle]   % Símbolos das listas de itens
\setbeamertemplate{enumerate items}[circle] % Símbolos das listas enumeradas
\setbeamertemplate{itemize subitem}{{\textendash}}
\setbeamerfont{itemize/enumerate subbody}{shape=\itshape}
\beamertemplatenavigationsymbolsempty       % Desabilita os botões de navegação
\setbeamertemplate{frametitle continuation}{}

% Ajusta as margens de parágrafos e itemize
\setlength{\leftmargini}{1em}
\setlength{\leftmarginii}{1em}
\setlength{\leftmarginiii}{1em}

% Ajusta o espaçamento entre os itens de uma lista
\let\OLDitemize\itemize
\renewcommand\itemize{\OLDitemize\addtolength{\itemsep}{1.5em}}

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
% Faixa superior
% -----------------------------------------------------------------------------
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

% -----------------------------------------------------------------------------
% Títulos
% -----------------------------------------------------------------------------
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

% -----------------------------------------------------------------------------
% Rodapé
% -----------------------------------------------------------------------------
\setbeamercolor{footline}{fg=gray}
\setbeamertemplate{footline}{%
    \hfill%
    \usebeamercolor[fg]{page number in head/foot}%
    \usebeamerfont{page number in head/foot}%
    \setbeamertemplate{page number in head/foot}[framenumber]%
    \usebeamertemplate*{page number in head/foot}\kern1em\vskip1em%
}

% -----------------------------------------------------------------------------
% Novos ambientes
% -----------------------------------------------------------------------------
\newtheorem{defn}{Defini\c c\~ao}
\newtheorem{teo}[theorem]{Teorema}
\newtheorem{ex}[theorem]{Exemplo}

% -----------------------------------------------------------------------------
% Referências
% -----------------------------------------------------------------------------

\setbeamertemplate{bibliography item}{$\bullet$ }

\renewenvironment{thebibliography}[1]
{%
    \list{\@biblabel{\@arabic\c@enumiv}}%
    {\settowidth\labelwidth{\beamer@biblabeltemplate{\@biblabel{#1}}}%
        \leftmargin=0cm
        \advance\leftmargin\labelsep
        \itemsep=2ex%
        \partopsep=0pt%
        \topsep=0pt%
        \usecounter{enumiv}%
        \let\p@enumiv\@empty
        \renewcommand\theenumiv{\@arabic\c@enumiv}
        \let\makelabel\beamer@biblabeltemplate}%
    \sloppy\raggedright
    \clubpenalty10000
    \@clubpenalty \clubpenalty
    \widowpenalty10000%
    \sfcode`\.\@m}{\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
    \ifhmode\unskip\fi\endlist}
