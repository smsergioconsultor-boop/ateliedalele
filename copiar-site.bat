@echo off
echo ========================================
echo    COPIANDO SITE ATELIE DA LELE
echo ========================================
echo.

REM Criar pasta de destino se não existir
if not exist "G:\Atelie_da_Lele" (
    echo Criando pasta G:\Atelie_da_Lele...
    mkdir "G:\Atelie_da_Lele"
)

echo Copiando arquivos do site...

REM Copiar arquivos principais do site
copy "index.html" "G:\Atelie_da_Lele\"
copy "loja.html" "G:\Atelie_da_Lele\"
copy "contato.html" "G:\Atelie_da_Lele\"
copy "sobre.html" "G:\Atelie_da_Lele\"
copy "portfolio.html" "G:\Atelie_da_Lele\"
copy "styles.css" "G:\Atelie_da_Lele\"

REM Copiar arquivos do admin
copy "admin-login.html" "G:\Atelie_da_Lele\"
copy "admin-dashboard.html" "G:\Atelie_da_Lele\"
copy "admin-access.html" "G:\Atelie_da_Lele\"

REM Copiar arquivo de configuração do Vercel
copy "vercel.json" "G:\Atelie_da_Lele\"

REM Copiar arquivos de documentação
copy "README.md" "G:\Atelie_da_Lele\"
copy "README-VERCEL.md" "G:\Atelie_da_Lele\"

echo.
echo ========================================
echo    SITE COPIADO COM SUCESSO!
echo ========================================
echo.
echo Arquivos copiados para: G:\Atelie_da_Lele
echo.
echo Arquivos incluidos:
echo - index.html (página principal)
echo - loja.html (loja)
echo - contato.html (contato)
echo - sobre.html (sobre)
echo - portfolio.html (portfólio)
echo - styles.css (estilos)
echo - admin-login.html (login admin)
echo - admin-dashboard.html (painel admin)
echo - admin-access.html (acesso admin)
echo - vercel.json (configuração)
echo - README.md (documentação)
echo.
pause 