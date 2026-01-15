# Script de Vérification de l'Environnement de Test
# Pour Lead Infrastructure & DevOps

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  VERIFICATION ENVIRONNEMENT DE TEST" -ForegroundColor Cyan
Write-Host "  Lead Infrastructure & DevOps - AEIG" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$allOk = $true

# Fonction de test
function Test-Tool {
    param(
        [string]$Name,
        [string]$Command,
        [bool]$Required = $true
    )
    
    Write-Host "[$Name]" -ForegroundColor Yellow -NoNewline
    try {
        $output = Invoke-Expression $Command 2>&1
        if ($LASTEXITCODE -eq 0 -or $output) {
            Write-Host " ✅ OK" -ForegroundColor Green
            Write-Host "  → $($output[0])" -ForegroundColor Gray
            return $true
        } else {
            throw "Command failed"
        }
    } catch {
        if ($Required) {
            Write-Host " ❌ ERREUR (REQUIS)" -ForegroundColor Red
            $script:allOk = $false
        } else {
            Write-Host " ⚠️  Non installé (optionnel)" -ForegroundColor Yellow
        }
        return $false
    }
    Write-Host ""
}

# Tests des outils
Write-Host "`n=== OUTILS REQUIS ===" -ForegroundColor Cyan
Test-Tool "WSL2" "wsl --status" $true
Test-Tool "Docker" "docker --version" $true
Test-Tool "Docker Compose" "docker-compose --version" $true
Test-Tool "Kubernetes" "kubectl version --client --short" $true
Test-Tool "Terraform" "terraform --version" $true
Test-Tool "Git" "git --version" $true

Write-Host "`n=== OUTILS OPTIONNELS ===" -ForegroundColor Cyan
Test-Tool "Helm" "helm version --short" $false
Test-Tool "Trivy" "trivy --version" $false

# Test Docker fonctionnel
Write-Host "`n=== TEST DOCKER ===" -ForegroundColor Cyan
Write-Host "[Docker Engine]" -ForegroundColor Yellow -NoNewline
try {
    docker ps > $null 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host " ✅ Docker Engine fonctionne" -ForegroundColor Green
    } else {
        throw "Docker not running"
    }
} catch {
    Write-Host " ❌ Docker Desktop n'est pas lancé" -ForegroundColor Red
    $allOk = $false
}

Write-Host "[Test Container]" -ForegroundColor Yellow -NoNewline
try {
    $output = docker run --rm hello-world 2>&1
    if ($output -match "Hello from Docker") {
        Write-Host " ✅ Conteneurs fonctionnent" -ForegroundColor Green
    } else {
        throw "Container test failed"
    }
} catch {
    Write-Host " ❌ Impossible de lancer un conteneur" -ForegroundColor Red
    $allOk = $false
}

# Test Kubernetes
Write-Host "`n=== TEST KUBERNETES ===" -ForegroundColor Cyan
Write-Host "[Kubernetes Cluster]" -ForegroundColor Yellow -NoNewline
try {
    $nodes = kubectl get nodes 2>&1
    if ($nodes -match "docker-desktop.*Ready") {
        Write-Host " ✅ Cluster Kubernetes actif" -ForegroundColor Green
        Write-Host "  → Node: docker-desktop (Ready)" -ForegroundColor Gray
    } else {
        throw "K8s not ready"
    }
} catch {
    Write-Host " ❌ Kubernetes non activé dans Docker Desktop" -ForegroundColor Red
    Write-Host "  → Activer dans: Docker Desktop → Settings → Kubernetes" -ForegroundColor Yellow
    $allOk = $false
}

# Test Terraform
Write-Host "`n=== TEST TERRAFORM ===" -ForegroundColor Cyan
Write-Host "[Terraform Init]" -ForegroundColor Yellow -NoNewline
$tempDir = "$env:TEMP\terraform-test-$(Get-Random)"
New-Item -ItemType Directory -Path $tempDir -Force > $null

$tfContent = @"
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}
provider "docker" {}
"@

Set-Content -Path "$tempDir\main.tf" -Value $tfContent

try {
    Push-Location $tempDir
    terraform init > $null 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host " ✅ Terraform fonctionne" -ForegroundColor Green
    } else {
        throw "Terraform init failed"
    }
} catch {
    Write-Host " ❌ Erreur Terraform" -ForegroundColor Red
    $allOk = $false
} finally {
    Pop-Location
    Remove-Item -Path $tempDir -Recurse -Force -ErrorAction SilentlyContinue
}

# Vérification ressources système
Write-Host "`n=== RESSOURCES SYSTEME ===" -ForegroundColor Cyan

$ram = [math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2)
Write-Host "[RAM]" -ForegroundColor Yellow -NoNewline
if ($ram -ge 16) {
    Write-Host " ✅ $ram GB (OK)" -ForegroundColor Green
} elseif ($ram -ge 8) {
    Write-Host " ⚠️  $ram GB (Minimum, peut être lent)" -ForegroundColor Yellow
} else {
    Write-Host " ❌ $ram GB (Insuffisant, minimum 8 GB)" -ForegroundColor Red
    $allOk = $false
}

$cpu = (Get-CimInstance Win32_Processor).NumberOfLogicalProcessors
Write-Host "[CPU]" -ForegroundColor Yellow -NoNewline
if ($cpu -ge 4) {
    Write-Host " ✅ $cpu cores (OK)" -ForegroundColor Green
} else {
    Write-Host " ⚠️  $cpu cores (Recommandé: 4+)" -ForegroundColor Yellow
}

$disk = [math]::Round((Get-PSDrive C).Free / 1GB, 2)
Write-Host "[Disque C:]" -ForegroundColor Yellow -NoNewline
if ($disk -ge 100) {
    Write-Host " ✅ $disk GB libres (OK)" -ForegroundColor Green
} elseif ($disk -ge 50) {
    Write-Host " ⚠️  $disk GB libres (Limite)" -ForegroundColor Yellow
} else {
    Write-Host " ❌ $disk GB libres (Insuffisant)" -ForegroundColor Red
    $allOk = $false
}

# Test connexion Internet
Write-Host "`n=== CONNECTIVITE ===" -ForegroundColor Cyan
Write-Host "[Internet]" -ForegroundColor Yellow -NoNewline
try {
    $ping = Test-Connection -ComputerName google.com -Count 1 -Quiet
    if ($ping) {
        Write-Host " ✅ Connexion Internet OK" -ForegroundColor Green
    } else {
        throw "No internet"
    }
} catch {
    Write-Host " ❌ Pas de connexion Internet" -ForegroundColor Red
    $allOk = $false
}

Write-Host "[Docker Hub]" -ForegroundColor Yellow -NoNewline
try {
    docker pull hello-world:latest > $null 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host " ✅ Accès Docker Hub OK" -ForegroundColor Green
    } else {
        throw "Cannot pull"
    }
} catch {
    Write-Host " ⚠️  Problème d'accès Docker Hub" -ForegroundColor Yellow
}

# Résumé final
Write-Host "`n========================================" -ForegroundColor Cyan
if ($allOk) {
    Write-Host "  ✅ ENVIRONNEMENT PRET POUR LE TEST" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Le candidat peut commencer le test technique." -ForegroundColor Green
    Write-Host "Repository: technical-test-fullstacks-devops" -ForegroundColor Gray
    Write-Host "Test: devops/test_lead_infrastructure.md" -ForegroundColor Gray
} else {
    Write-Host "  ❌ ENVIRONNEMENT INCOMPLET" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Veuillez corriger les erreurs ci-dessus avant de commencer." -ForegroundColor Yellow
    Write-Host "Consultez: devops/INSTALLATION_GUIDE.md" -ForegroundColor Gray
}
Write-Host ""

# Générer un rapport
$reportPath = "$PSScriptRoot\verification-report.txt"
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

$report = @"
===========================================
RAPPORT DE VERIFICATION - ENVIRONNEMENT TEST
===========================================
Date: $timestamp
Statut: $(if ($allOk) { "✅ PRET" } else { "❌ INCOMPLET" })

SYSTEME:
- RAM: $ram GB
- CPU: $cpu cores
- Disque libre: $disk GB

OUTILS:
- Docker: $(docker --version 2>&1)
- Kubernetes: $(kubectl version --client --short 2>&1)
- Terraform: $(terraform --version 2>&1)
- Git: $(git --version 2>&1)

===========================================
"@

Set-Content -Path $reportPath -Value $report
Write-Host "Rapport sauvegardé: $reportPath" -ForegroundColor Gray
Write-Host ""
