@echo off
echo ========================================
echo    ADICIONAR FOTOS DOS PRODUTOS
echo    ATELIE DA LELE
echo ========================================
echo.

echo [1/4] Verificando estrutura de pastas...
if not exist "images" (
    mkdir images
    echo ✅ Pasta images criada!
)
if not exist "images\produtos" (
    mkdir images\produtos
    echo ✅ Pasta produtos criada!
)
echo ✅ Estrutura de pastas OK!

echo.
echo [2/4] Verificando arquivos necessários...
echo.
echo 📁 PASTA: images\produtos\
echo.
echo Arquivos esperados:
echo ├── album-casamento.jpg
echo ├── scrapbook-baby.jpg  
echo └── kit-scrapbook.jpg
echo.

if exist "images\produtos\album-casamento.jpg" (
    echo ✅ album-casamento.jpg encontrado
) else (
    echo ❌ album-casamento.jpg - ADICIONAR
)

if exist "images\produtos\scrapbook-baby.jpg" (
    echo ✅ scrapbook-baby.jpg encontrado
) else (
    echo ❌ scrapbook-baby.jpg - ADICIONAR
)

if exist "images\produtos\kit-scrapbook.jpg" (
    echo ✅ kit-scrapbook.jpg encontrado
) else (
    echo ❌ kit-scrapbook.jpg - ADICIONAR
)

echo.
echo [3/4] Instruções para adicionar fotos:
echo.
echo 📸 COMO ADICIONAR FOTOS:
echo.
echo 1. Tire fotos dos produtos com:
echo    - Boa iluminação (luz natural)
echo    - Fundo neutro (branco/bege)
echo    - Tamanho: 800x600 pixels
echo    - Formato: JPG
echo.
echo 2. Salve com os nomes:
echo    - album-casamento.jpg
echo    - scrapbook-baby.jpg
echo    - kit-scrapbook.jpg
echo.
echo 3. Cole na pasta: images\produtos\
echo.
echo 4. Execute este script novamente para verificar
echo.

echo [4/4] Abrindo pasta de imagens...
explorer "images\produtos"
echo.
echo ========================================
echo    PROXIMOS PASSOS:
echo ========================================
echo.
echo 1. Adicione as fotos na pasta aberta
echo 2. Execute este script novamente
echo 3. Teste o site localmente
echo 4. Faça commit e push para GitHub
echo.
echo 🎉 Deploy automático no Vercel!
echo.
pause 