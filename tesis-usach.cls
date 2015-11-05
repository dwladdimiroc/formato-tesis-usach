\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tesis-usach}[2015/08/31 Template Thesis USACH]

% Agradecimiento a todos los que ayudaron a realizar este template versión estandarizada de la Universidad de Santiago de Chile, entre ellos Emir Muñoz, Rodrigo Campos, Hugo Meneses, Víctor Flores, Pablo González y Daniel Wladdimiro :)

\newif\ifkeys\keysfalse
\newif\iftxfonts\txfontsfalse
\newif\ifdosguias\dosguiasfalse
\newif\ifpropuesta\propuestafalse
\DeclareOption{keys}{\keystrue}
\DeclareOption{txfonts}{\txfontstrue}
\DeclareOption{dosguias}{\dosguiastrue}
\DeclareOption{propuesta}{\propuestatrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

% Letra tamaño 10pt, hoja carta y formato de dos planas
\LoadClass[10pt,twoside,letterpaper]{book}

% Letra Arial
\renewcommand{\rmdefault}{phv}
\renewcommand{\sfdefault}{phv}

% Interlineado de 1.5:
\renewcommand{\baselinestretch}{1.5}

% #### Init file 'tesis-postgrado.cls' ####

% Archivos suplementarios
\RequirePackage[spanish]{babel}
\RequirePackage[utf8]{inputenc}
\ifkeys\RequirePackage[notref,notcite]{showkeys}\fi

% Configuración de header y footer
\RequirePackage{fancybox}
\RequirePackage{fancyhdr}
\RequirePackage{float}

% Símbolos y fuentes
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{amssymb,latexsym}
\RequirePackage{amstext}
\RequirePackage{amsthm}
\RequirePackage{marvosym}
\RequirePackage{mathcomp}
\RequirePackage{setspace}
\RequirePackage{stmaryrd}
\RequirePackage{textcomp}
\RequirePackage{units}
\RequirePackage{upgreek}

\iftxfonts\RequirePackage{txfonts}\fi

% Entornos y figuras
\RequirePackage{verbatim}
\RequirePackage{fancyvrb}
\RequirePackage{enumerate}

% Imágenes y comandos para figuras de GNUPlot
\RequirePackage{graphicx}
\RequirePackage{epsf}
\RequirePackage{psfrag}
\RequirePackage{epic,eepic}
\usepackage{subfig}
\usepackage[titles,subfigure]{tocloft}
\usepackage{color}

% Referencias
\RequirePackage{hyperref}
\RequirePackage[all]{hypcap}
\RequirePackage{url}

% Tablas
\RequirePackage{multirow}	% Multiples filas en Tablas
\RequirePackage{array}
\RequirePackage{caption}
\captionsetup[table]{position=top,belowskip=4pt,aboveskip=4pt}
\RequirePackage{longtable}	% Para cortar tablas grandes
\RequirePackage{lscape}

% Anexos
\RequirePackage{appendix}

% Tabla de contenidos
\RequirePackage[nottoc,notlot,notlof,notbib]{tocbibind}

%--------Algoritmos
\RequirePackage[ruled,algochapter,linesnumbered]{algorithm2e}
\renewcommand{\algorithmcfname}{Algoritmo}
\RequirePackage{algorithmic}
\setlength{\algomargin}{1.5em}
\renewcommand{\algorithmicrequire}{\textbf{Entrada:}}
\renewcommand{\algorithmicensure}{\textbf{Salida:}}
\renewcommand{\algorithmiccomment}[1]{//#1}
\RequirePackage{etoolbox}										% Interlineado

% Enumeración de cada figura y algoritmo
\RequirePackage{tesis-enumeracion}

% Listing de código
\RequirePackage{listings} % For insert code in the paper
\lstset{ 
    frame=Ltb,
    framerule=0pt,
    aboveskip=0.2cm,			%0.5cm
    framextopmargin=1pt,		%3pt
    framexbottommargin=1pt,	%4pt
    framexleftmargin=0cm,
    framesep=0pt,
    rulesep=.4pt,
    backgroundcolor=\color{gray97},
    rulesepcolor=\color{black},
    stringstyle=\ttfamily,
    showstringspaces=false,
    basicstyle=\scriptsize\ttfamily,	%\small \scriptsize
    commentstyle=\color{gray45},
    keywordstyle=\bfseries,
    numbers=left,
    numbersep=4pt,			%15pt
    numberstyle=\tiny,
    numberfirstline=false,
    breaklines=true,
    tabsize=4,
    upquote=true,
    extendedchars=true,
    morecomment=[s]{/**\<}{*/},
    morecomment=[s]{/*}{*/},
}

% Minimizar fragmentado de listados
\lstnewenvironment{listing}[1][]
    {\lstset{#1}\pagebreak[0]}
    {\pagebreak[0]}

% Estilo para código Java    
\lstloadlanguages{Java}

\definecolor{javared}{rgb}{0.6,0,0}				% For strings
\definecolor{javagreen}{rgb}{0.25,0.5,0.35}		% Comments
\definecolor{javapurple}{rgb}{0.5,0,0.35}		% Keywords
\definecolor{javadocblue}{rgb}{0.25,0.35,0.75}	% Javadoc

\lstset{
	language=Java,
	captionpos=b,
	basicstyle=\small,
	keywordstyle=\color{javapurple}\bfseries,
	stringstyle=\color{javared},
	commentstyle=\color{javagreen},
	morecomment=[s][\color{javadocblue}]{/**}{*/},
	numbers=left,
	numberstyle=\tiny\color{black},
	stepnumber=1,
	numbersep=10pt,
	tabsize=4,
	showspaces=false,
	showstringspaces=false
}

% Soporte para tablas con color
\usepackage[table,xcdraw]{xcolor}
\usepackage{color}
\definecolor{gray97}{gray}{.97}
\definecolor{gray75}{gray}{.75}
\definecolor{gray45}{gray}{.45}

% Bibliografia
\RequirePackage{natbib}
\RequirePackage[fixlanguage]{babelbib}
\selectbiblanguage{spanish}
\bibpunct{(}{)}{;}{}{,}{,}
\setcounter{secnumdepth}{3}	%Mostrar numeración en las subsubsecciones
\setcounter{tocdepth}{3}		%Mostrar las subsubsecciones en el índice

% Teoremas, definiciones, ejemplos y lemas
\newtheoremstyle{teorema}{\topsep}{\topsep}
    {\normalfont}	% Body font
    {}				% Indent amount (empty = no indent, \parindent = para indent)
    {\bfseries}		% Theorem head font
    {}				% Punctuation after theorem head
    { }				% Space after theorem head (\newline = linebreak)
    {\thmname{#1}\thmnumber{ #2}\thmnote{ #3}} % Thm head spec
\theoremstyle{teorema}
\newtheorem{teorema}{Teorema}[chapter]

\newtheoremstyle{ejemplo}{\topsep}{\topsep}
    {\normalfont}	% Body font
    {}				% Indent amount (empty = no indent, \parindent = para indent)
    {\bfseries}		% Theorem head font
    {}				% Punctuation after theorem head
    { }				% Space after theorem head (\newline = linebreak)
    {\thmname{#1}\thmnumber{ #2}\thmnote{ #3}} % Thm head spec
\theoremstyle{ejemplo}
\newtheorem{ejemplo}{Caso}[chapter]%Ejemplo

\newtheoremstyle{definicion}{\topsep}{\topsep}%
    {\normalfont}	% Body font
    {}				% Indent amount (empty = no indent, \parindent = para indent)
    {\bfseries}		% Theorem head font
    {}				% Punctuation after theorem head
    { }				% Space after theorem head (\newline = linebreak)
    {\thmname{#1}\thmnumber{ #2}\thmnote{ #3}} % Thm head spec
\theoremstyle{definicion}
\newtheorem{definicion}{Definici\'on}[chapter]

\newtheoremstyle{lema}{\topsep}{\topsep}%
    {\normalfont}	% Body font
    {}				% Indent amount (empty = no indent, \parindent = para indent)
    {\bfseries}		% Theorem head font
    {}				% Punctuation after theorem head
    { }				% Space after theorem head (\newline = linebreak)
    {\thmname{#1}\thmnumber{ #2}\thmnote{ #3}} % Thm head spec
\theoremstyle{lema}
\newtheorem{lema}{Lema}[chapter]

\newenvironment{prueba}[1][Demostraci\'on]
{
    \begin{trivlist}
    \item[\hskip \labelsep {\bfseries #1}]
}{\end{trivlist}}

\renewcommand{\qed}
{   
    \nobreak \ifvmode \relax \else
    \ifdim\lastskip<1.5em \hskip-\lastskip
    \hskip1.5em plus0em minus0.5em \fi \nobreak
    \vrule height0.75em width0.5em depth0.25em\fi
}


% Notaciones Generales
\newcommand{\textrev}[1]{\textbf{#1}}
\newcommand{\emphrule}[1]{\emph{#1}}
\newcommand{\normlen}[1]{\ensuremath{\left |#1\right |}}

\newcommand\ie{i.e.\@\xspace}
\newcommand\eg{e.g.\@\xspace}
\newcommand\cf{cf.\@\xspace}
\newcommand\ds{\slash\hspace*{-.6ex}\slash}
\newcommand{\bra}[1]{[\hspace{-.4ex}[#1]\hspace{-.4ex}]}

% Notaciones específicas
\newcommand{\keyclass}[4][*]{\ensuremath{\mathcal{K}^{\scriptscriptstyle#2}_{\scriptscriptstyle #3,#4^{#1}}}}
\newcommand{\keyclassl}[4][+]{\ensuremath{\mathcal{K}(PL^{\{#2\}}, PL^{\{#3\}}, PL^{\{#4\}}_{#1})}}
\newcommand{\labels}{\ensuremath{\mathcal L}}
\newcommand{\anylabel}{\ensuremath{\ell}}
\newcommand{\fixedlabel}{\ensuremath{\anylabel_0}}
\newcommand{\zerolabel}{\ensuremath{\varepsilon}}
\newcommand{\wildcard}{\ensuremath{\_^*}}
\newcommand{\dipath}{\ensuremath{D}}
\newcommand{\pin}{\ensuremath{\lesssim}}
\newcommand{\pathexp}[2]{\ensuremath{#1}\textlbrackdbl\ensuremath{{#2}}\textrbrackdbl}

% Definición del estilo del header y footer
\lhead{\chaptername \thechapter. \chaptermark}
\chead{}
    \fancyfoot[LE,RO]{\thepage}
\cfoot{}

%Hace que la primera página de cada capítulo no tenga el header por defecto y que en el footer el N° de página no esté al centro
\fancypagestyle{plain}{
    \fancyhf{}	% Clear all header and footer fields
	\fancyfoot[LE,RO]{\thepage}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

% Cambios al default de spanish
%\deactivatetilden
%\decimalpoint

% Headings
\markboth{}{}

% Renombre de los títulos por defecto
\renewcommand\captionsspanish{}

\renewcommand{\contentsname}{\centerline{Tabla de contenido}}
\renewcommand{\listtablename}{\centerline{Índice de tablas}}
\renewcommand{\listfigurename}{\centerline{Índice de ilustraciones}}
\renewcommand{\listalgorithmcfname}{\centerline{Índice de algoritmos}}

\renewcommand{\bibname}{Bibliografía}

\renewcommand{\appendixname}{Anexo}
\renewcommand{\appendixtocname}{Anexos}
\renewcommand{\appendixpagename}{Anexo}

\renewcommand{\tablename}{Tabla}
\renewcommand{\figurename}{Figura}
\renewcommand{\lstlistingname}{Código}
\renewcommand{\chaptername}{Capítulo}

% Header de los capítulos
\usepackage[compact]{titlesec}
\titleformat{\chapter}
{\bfseries\Large\vspace*{-4.0cm}}	% Formato título
{	% Contenido de la etiqueta
    \filright
    \Large\MakeUppercase\chaptertitlename\ \thechapter.\ 
}
{0pt} % Espacio mínimo entre etiqueta y cuerpo
{\filright\MakeUppercase} % Código que precede al cuerpo del título
[\vspace{1.5pt}] % Margen de 1.5pt

\titleformat{\section}
{\bfseries\large\vspace{2pt}}
{\large\MakeUppercase\thesection\ \vspace{2pt} } % 3 espacios luego del titulo de una seccion
{0pt}
{\MakeUppercase}
[\vspace*{0.5cm}]

\titleformat{\subsection}
{\bfseries\normalsize\vspace{2pt}}
{\normalsize\thesubsection\ }
{0pt}
{\vspace*{0.5cm}}

\titleformat{\subsubsection}
{\itshape\normalsize\vspace{1.0cm}}
{\itshape\thesubsubsection\ }
{0pt}
{\vspace*{0.5cm}\itshape}

\titlespacing*{\chapter} {0pt}{85pt}{20pt} 
\titlespacing*{\section} {0pt}{6.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
\titlespacing*{\subsection} {0pt}{6.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
\titlespacing*{\subsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
\titlespacing*{\paragraph} {0pt}{3.25ex plus 1ex minus .2ex}{1em}
\titlespacing*{\subparagraph} {\parindent}{3.25ex plus 1ex minus .2ex}{1em}

% Se agrega la palabra 'Figura' al índice de figuras
\renewcommand{\cftfigfont}{Figura~}
% Espacio entre los números y el caption de la Figura
\setlength{\cftfignumwidth}{2.75em}

% Lo mismo para el índice de tablas
\renewcommand{\cfttabfont}{Tabla~}
% Espacio entre los números y el caption de la Tabla
\setlength{\cfttabnumwidth}{2em}


% Margenes según el reglamento en tamaño carta
\RequirePackage[headheight=14pt, letterpaper]{geometry}
\geometry{top=2.5cm, bottom=2.5cm, left=4cm, right=2.5cm}

% Otro tipo de márgenes
\setlength{\parindent}{2cm}	%2cm Tabulación
\setlength{\headsep}{20pt}	%20
\setlength{\voffset}{0.0cm}
\setlength{\hoffset}{0.0cm}
\setlength{\footskip}{20pt}	%20

% Evitar que corte las palabras al final
\setlength{\pretolerance}{2000}
\setlength{\tolerance}{3000}

% Página en blanco
\newcommand{\paginaenblanco}{\newpage{\pagestyle{empty}\cleardoublepage\null}}

% Referenciacion en la forma: 1-5
\newcommand{\lref}[2]{\ref{#1}--\ref{#2}}
% Referenciacion en la forma:  (1)
\newcommand{\cref}[1]{(\ref{#1})}
% Referenciacion en la forma:  (1)-(5)
\newcommand{\clref}[2]{(\ref{#1})--(\ref{#2})}
% Otras referencias
\newcommand{\Ref}[1]{Ref.\ \cite{#1}}
\newcommand{\dRef}[2]{Refs.\ \cite{#1},\cite{#2}}

% Comandos Matemáticos
\newcommand{\Real}{\mbox{Re }}	% Parte real
\newcommand{\Imag}{\mbox{Im }}	% Parte imaginiaria
\newfont{\msamfnt}{msam10} % Mayor/menor o igual y aproximado
\newcommand{\msam}[1]{\mbox{ \msamfnt #1}\ }
\newcommand{\simgeq}{\msam \&}
\newcommand{\simleq}{\msam .}

% Abreviaciones
\newcommand{\Capt}[1]{Cap.\ \ref{#1}}
\newcommand{\Fig}[1]{Fig.\ \ref{#1}}
\newcommand{\Sec}[1]{Sec.\ \ref{#1}}

% Comando de espaciado
\newcommand{\salto}{\vspace{.5cm}}

% Carátula y Portada
\def\@facultad{} \def\@departamento \def\@grado
\def\@title{} \def\@autor{} \def\@fecha{} \def\@profesorguia{} \def\@profesorcoguia{} \def\@nombreuno{} \def\@nombredos{} \def\@nombretres{}
\def\@ciudad{} \def\@pais{} \def\@run{} \def\@telefono{} \def\@email{} \def\@annoingreso{}
\newcommand{\keywords}[1]{\def\keywords{#1}}
\def\facultad#1{\gdef\@facultad{#1}}
\def\departamento#1{\gdef\@departamento{#1}}
\def\grado#1{\gdef\@grado{#1}}
\def\titulo#1{\gdef\@title{\begin{center}{\large\bf#1}%
\end{center}}\gdef\@titleMay{\begin{center}{\large\bf#1}%
\end{center}}}
\def\autor#1{\gdef\@autor{{\bfseries #1}}\gdef\@autorn{#1}}
\def\fecha#1#2#3#4{\gdef\@diasemana{#1}\gdef\@diaexamen{#2}\gdef\@mesexamen{#3}%
\gdef\@annoexamen{#4}\gdef\@fecha{#3, #4}}
\def\profesorguia#1{\gdef\@profesorguia{#1}}
\def\profesorcoguia#1{\gdef\@profesorcoguia{#1}}
\def\nombreuno#1{\gdef\@nombreuno{#1}}
\def\nombredos#1{\gdef\@nombredos{#1}}
\def\nombretres#1{\gdef\@nombretres{#1}}
\def\regular#1{\gdef\@regular{#1}}
\def\externo#1{\gdef\@externo{#1}}
\def\presidente#1{\gdef\@presidente{#1}}
\def\ciudad#1{\gdef\@ciudad{#1}}
\def\pais#1{\gdef\@pais{#1}}
\def\run#1{\gdef\@run{#1}}
\def\telefono#1{\gdef\@telefono{#1}}
\def\email#1{\gdef\@email{#1}}
\def\annoingreso#1{\gdef\@annoingreso{#1}}

% Información del documento PDF
\hypersetup
{
    bookmarksopen, bookmarksnumbered, pdfdisplaydoctitle=true,
    pdftitle=\@title,
    pdfauthor=\@autor,
    pdfsubject=Tesis de grado,
    pdfkeywords=,
    pdfcreator=Universidad de Santiago de Chile,
    pdfproducer=Departamento de Ingenier\'ia Inform\'atica,
    colorlinks=true,
    linkcolor=black,
    citecolor=black,
    filecolor=black,
    urlcolor=black,
    linkbordercolor={1 0 0},
    citebordercolor={0 1 0}
}

% Cubierta
\newcommand{\makecubierta}
{
\vspace*{-1.0cm}
\begin{picture}(18,4)(0,40)
	\put(340,-7){\includegraphics[scale=.25]{./images/LogoUsach.png}}
\end{picture}

\sloppy
\thispagestyle{empty}
\vspace*{-1.5cm}

\begin{center}
    {\bf \Large UNIVERSIDAD DE SANTIAGO DE CHILE}\\
    {\bf \large FACULTAD DE \MakeUppercase{\@facultad}}\\
    {\bf \large Departamento de \@departamento}\\
\end{center}

\ifpropuesta		% Si se trata de la propuesta
    \vspace*{5cm}
    {\@titleMay\par}
    \vspace{3.5cm}
    \begin{flushright}
        \begin{tabular}[t]{l l}
            Nombre: & \@autor \\
            %Nombre 2: & \@nombredos \\
            %Nombre 3: & \@nombretres \\
            R.U.N.: & \@run \\
            A\~no Ingreso: & \@annoingreso \\
            Teléfono: & \@telefono \\
            E-mail: & \@email \\
            \ifdosguias Profesores: \else Profesor: \fi &
            \ifdosguias
                {\normalfont \@profesorguia} \\ 
                & {\normalfont \@profesorcoguia} \\
            \else
                \@profesorguia \\
            \fi
        \end{tabular}
    \end{flushright}
    \begin{center}
        \vspace{1.5cm}
        \@diasemana, \@diaexamen\ de \@mesexamen\ de \@annoexamen
    \end{center}
\else	% Si se trata del documento final
    \vspace*{4cm}
    {\@titleMay\par}
        \begin{center}
			\vspace*{2.5cm}
			{\bf \normalsize \@autor}\\[1cm]
			\vspace*{2.5cm}
			\begin{flushleft}
				{\normalsize \hspace{7cm} Profesor guía: \@profesorguia}\\
				\ifdosguias
				{\normalsize \hspace{7cm} Profesora co-guía: \@profesorcoguia}\\
				\fi
				\vspace{1cm}
				\hspace{6.8cm}
				{\normalsize
				\begin{tabular}{p{5.5cm}}
					Tesis de grado presentada en conformidad a los requisitos \mbox{para obtener el grado de} \@grado
				\end{tabular}
				}
			\end{flushleft}
			\vspace*{1cm}
			\null
			\vfill
			{\normalsize \@ciudad\ -- \@pais\\
			\@annoexamen}
        \end{center}\par    
\fi
} % End \makecubierta



% Copyright
\newcommand{\makecopyright}
{
    \ifpropuesta
        % no va copyright
    \else
        \null
		\vfill\par
        \begin{flushleft}
			\copyright\ 
			\@autor \; - \@annoexamen \\ 
			\includegraphics[height=12pt]{images/licences/cc_by.png}
				~$\bullet$~~ Algunos derechos reservados. Esta obra está bajo una Licencia Creative Commons Atribución-Chile 3.0. Sus condiciones de uso pueden ser revisadas en: \url{http://creativecommons.org/licenses/by/3.0/cl/}.      
        \end{flushleft}
    \fi
}

% Dedicatoria
\newenvironment{dedicatoria}[1]
{
    \vspace*{17cm}\par
    \hspace*{5cm}
    \begin{flushright}
    \textit{#1}
    \end{flushright}
}{}

% Agradecimientos
\newenvironment{agradecimiento}
{
    \chapter*{\centerline{AGRADECIMIENTOS}}
}{}

% Resumen
\newcommand{\KeywordsES}[1]
{
    \par\noindent
    {\bf Palabras Claves\/}: #1
}
\newcommand{\resumenCastellano}[1]
{
    \chapter*{\centerline{Resumen}}
    \addcontentsline{toc}{chapter}{Resumen}
#1
}

% Abstract
\newcommand{\KeywordsEN}[1]
{
    \par\noindent
    {\bf Keywords\/}: #1
}
\newcommand{\resumenIngles}[1]
{
    \chapter*{\centerline{Abstract}}
    \addcontentsline{toc}{chapter}{Abstract}
#1
}

% Glosario
\newenvironment{glosario}
{
    \begin{center}
        \textbf{\Large GLOSARIO}
    \end{center}
}{}

\endinput

% #### End file 'tesis-postgrado.cls' ####