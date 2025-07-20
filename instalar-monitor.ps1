# Script de Instalação - Unus Solutions WildFly Monitor
# Autor: PIT - Unus Solutions

param(
    [string]$PastaDestino = "C:\UnusSolutions\WildFlyMonitor",
    [string]$Ambiente = "producao",
    [string]$WildFlyHost = "localhost",
    [string]$DatabaseHost = "localhost"
)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "    Unus Solutions - Instalacao Monitor" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Verificar se está executando como administrador
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

if (-not $isAdmin) {
    Write-Host "⚠️  Recomendado executar como Administrador" -ForegroundColor Yellow
    Write-Host "   Algumas funcionalidades podem não funcionar" -ForegroundColor Yellow
    Write-Host ""
}

# 1. Criar pasta de destino
Write-Host "📁 Criando pasta de destino..." -ForegroundColor Green
if (-not (Test-Path $PastaDestino)) {
    New-Item -ItemType Directory -Path $PastaDestino -Force | Out-Null
    Write-Host "   ✅ Pasta criada: $PastaDestino" -ForegroundColor Green
        } else {
    Write-Host "   ✅ Pasta já existe: $PastaDestino" -ForegroundColor Green
}

# 2. Copiar arquivos (simulação - em produção seria cópia real)
Write-Host "📋 Copiando arquivos..." -ForegroundColor Green
$arquivos = @(
    "senior-status-dashboard.html",
    "verificar-wildfly-real.ps1",
    "verificar-ambiente.ps1",
    "config-ambientes.json",
    "verificar-ambiente.bat",
    "executar-verificacao.bat",
    "README-DASHBOARD.md",
    "INSTALACAO.md"
)

foreach ($arquivo in $arquivos) {
    if (Test-Path $arquivo) {
        Copy-Item $arquivo -Destination $PastaDestino -Force
        Write-Host "   ✅ $arquivo" -ForegroundColor Green
        } else {
        Write-Host "   ⚠️  $arquivo (não encontrado)" -ForegroundColor Yellow
        }
    }
    
# 3. Configurar política de execução
Write-Host "🔧 Configurando politica de execucao..." -ForegroundColor Green
    try {
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
    Write-Host "   ✅ Politica configurada" -ForegroundColor Green
    } catch {
    Write-Host "   ⚠️  Erro ao configurar politica: $($_.Exception.Message)" -ForegroundColor Yellow
}

# 4. Configurar ambiente
Write-Host "⚙️  Configurando ambiente..." -ForegroundColor Green
$configPath = Join-Path $PastaDestino "config-ambientes.json"

if (Test-Path $configPath) {
    $config = Get-Content $configPath | ConvertFrom-Json
    
    # Atualizar configuração do ambiente
    if ($config.ambientes.$Ambiente) {
        $config.ambientes.$Ambiente.wildflyHost = $WildFlyHost
        $config.ambientes.$Ambiente.databaseHost = $DatabaseHost
        
        $config | ConvertTo-Json -Depth 3 | Out-File $configPath -Encoding UTF8
        Write-Host "   ✅ Ambiente '$Ambiente' configurado" -ForegroundColor Green
        Write-Host "   WildFly: $WildFlyHost" -ForegroundColor Cyan
        Write-Host "   Banco: $DatabaseHost" -ForegroundColor Cyan
        } else {
        Write-Host "   ⚠️  Ambiente '$Ambiente' não encontrado na configuração" -ForegroundColor Yellow
    }
}

# 5. Criar atalhos
Write-Host "🔗 Criando atalhos..." -ForegroundColor Green
        $desktop = [Environment]::GetFolderPath("Desktop")
$startMenu = [Environment]::GetFolderPath("StartMenu")
        
# Atalho no Desktop
$shortcutPath = Join-Path $desktop "UnusSolutions-WildFlyMonitor.lnk"
        $WshShell = New-Object -comObject WScript.Shell
        $Shortcut = $WshShell.CreateShortcut($shortcutPath)
$Shortcut.TargetPath = Join-Path $PastaDestino "senior-status-dashboard.html"
$Shortcut.Description = "Unus Solutions - WildFly Monitor"
        $Shortcut.Save()
        
Write-Host "   ✅ Atalho criado no Desktop" -ForegroundColor Green

# 6. Testar instalação
Write-Host "🧪 Testando instalacao..." -ForegroundColor Green
Set-Location $PastaDestino

try {
    # Testar script de verificação
    $result = & ".\verificar-ambiente.ps1" -Ambiente $Ambiente 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "   ✅ Script de verificacao funcionando" -ForegroundColor Green
        } else {
        Write-Host "   ⚠️  Script de verificacao com problemas" -ForegroundColor Yellow
        }
    } catch {
    Write-Host "   ⚠️  Erro ao testar script: $($_.Exception.Message)" -ForegroundColor Yellow
}

# 7. Criar tarefa agendada (opcional)
Write-Host "⏰ Criando tarefa agendada..." -ForegroundColor Green
try {
    $taskName = "UnusSolutions-WildFlyMonitor"
    $scriptPath = Join-Path $PastaDestino "verificar-ambiente.ps1"
    
    # Remover tarefa existente se houver
    Unregister-ScheduledTask -TaskName $taskName -Confirm:$false -ErrorAction SilentlyContinue
    
    # Criar nova tarefa
    $action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File `"$scriptPath`" -Ambiente $Ambiente"
    $trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 5)
    $principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest
    
    Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Principal $principal -Description "Unus Solutions WildFly Monitor" | Out-Null
    
    Write-Host "   ✅ Tarefa agendada criada (verificacao a cada 5 minutos)" -ForegroundColor Green
} catch {
    Write-Host "   ⚠️  Erro ao criar tarefa agendada: $($_.Exception.Message)" -ForegroundColor Yellow
}

# 8. Resumo da instalação
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "    INSTALACAO CONCLUIDA!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "📁 Pasta de instalacao: $PastaDestino" -ForegroundColor Yellow
Write-Host "🌐 Dashboard: $PastaDestino\senior-status-dashboard.html" -ForegroundColor Yellow
Write-Host "🔧 Script de verificacao: $PastaDestino\verificar-ambiente.bat" -ForegroundColor Yellow
Write-Host "📋 Documentacao: $PastaDestino\INSTALACAO.md" -ForegroundColor Yellow
Write-Host ""
Write-Host "🚀 Para usar:" -ForegroundColor Green
Write-Host "   1. Abra o dashboard: $PastaDestino\senior-status-dashboard.html" -ForegroundColor Cyan
Write-Host "   2. Execute verificacao: .\verificar-ambiente.bat $Ambiente" -ForegroundColor Cyan
Write-Host "   3. Configure contatos da TI no dashboard" -ForegroundColor Cyan
Write-Host ""
Write-Host "📞 Suporte: ti@unussolutions.com" -ForegroundColor Yellow
Write-Host ""

# Abrir dashboard automaticamente
Write-Host "Abrindo dashboard..." -ForegroundColor Green
Start-Process (Join-Path $PastaDestino "senior-status-dashboard.html")

Write-Host "✅ Instalacao concluida com sucesso!" -ForegroundColor Green 