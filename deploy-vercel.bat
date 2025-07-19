@echo off
echo ========================================
echo    ATELIE DA LELE - DEPLOY VERCEL
echo ========================================
echo.

echo [1/4] Verificando arquivos...
if not exist "index.html" (
    echo ERRO: Arquivo index.html nao encontrado!
    pause
    exit /b 1
)
if not exist "vercel.json" (
    echo ERRO: Arquivo vercel.json nao encontrado!
    pause
    exit /b 1
)
echo ✅ Arquivos principais encontrados!

echo.
echo [2/4] Verificando Git...
git --version >nul 2>&1
if errorlevel 1 (
    echo ERRO: Git nao esta instalado!
    echo Baixe em: https://git-scm.com/
    pause
    exit /b 1
)
echo ✅ Git encontrado!

echo.
echo [3/4] Inicializando Git (se necessario)...
if not exist ".git" (
    git init
    echo ✅ Repositorio Git inicializado!
) else (
    echo ✅ Repositorio Git ja existe!
)

echo.
echo [4/4] Preparando para deploy...
echo.
echo ========================================
echo    PROXIMOS PASSOS:
echo ========================================
echo.
echo 1. Crie um repositorio no GitHub:
echo    - Acesse: https://github.com
echo    - Clique em "New repository"
echo    - Nome: atelie-da-lele-site
echo    - Publico (gratuito)
echo.
echo 2. Execute os comandos Git:
echo    git add .
echo    git commit -m "Initial commit - Site Atelie da Lele"
echo    git branch -M main
echo    git remote add origin https://github.com/SEU_USUARIO/atelie-da-lele-site.git
echo    git push -u origin main
echo.
echo 3. Deploy no Vercel:
echo    - Acesse: https://vercel.com
echo    - Login com GitHub
echo    - "New Project" -> Selecione o repositorio
echo    - Clique em "Deploy"
echo.
echo ========================================
echo    ARQUIVOS PRONTOS:
echo ========================================
echo ✅ index.html - Pagina principal
echo ✅ loja.html - Loja virtual
echo ✅ sobre.html - Sobre nos
echo ✅ portfolio.html - Portfolio
echo ✅ contato.html - Contato
echo ✅ vercel.json - Configuracao Vercel
echo ✅ styles.css - Estilos personalizados
echo ✅ README-VERCEL.md - Guia completo
echo.
echo 🎉 Site pronto para deploy!
echo.
pause 