# Test Technique – Lead Infrastructure & DevOps

## 🎯 Objectif
Évaluer les compétences d'un Lead Infrastructure & DevOps pour concevoir, déployer et maintenir une infrastructure robuste, sécurisée et scalable pour un environnement multi-campus (Cotonou, Abidjan).

---

## 🖥️ Environnement de test fourni
- **PC Windows** avec :
  - Docker Desktop (avec WSL2)
  - Terraform
  - Git
  - VS Code (ou éditeur de votre choix)
  - Connexion Internet

---

## 📋 Structure des exercices

### **Partie 1 : Infrastructure as Code (IaC)** — 35%
### **Partie 2 : Orchestration & Conteneurisation** — 30%
### **Partie 3 : Architecture Multi-Campus** — 20%
### **Partie 4 : Monitoring & Sécurité** — 15%

---

## 🏗️ PARTIE 1 — Infrastructure as Code (Terraform)

### Exercice 1.1 — Provisionnement Cloud Simulé (Local)
**Contexte :** Vous devez créer une infrastructure reproductible pour héberger les plateformes AEIG (LMS, CRM, Intranet).

**Tâches :**
1. Créer une infrastructure Terraform qui provisionne **localement** (via Docker provider) :
   - 3 conteneurs applicatifs (web-cotonou, web-abidjan, web-backup)
   - 1 conteneur base de données PostgreSQL
   - 1 conteneur reverse proxy Nginx
   - 1 réseau privé isolé

2. Utiliser des **modules Terraform** pour :
   - Module `network` : création du réseau Docker
   - Module `database` : déploiement PostgreSQL avec volumes persistants
   - Module `application` : déploiement des apps avec variables d'environnement

3. Implémenter des **workspaces Terraform** :
   - `dev` : 1 instance de chaque service
   - `staging` : 2 instances applicatives (load balancing)
   - `production` : 3 instances + réplication DB

**Livrables :**
```
terraform/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars.example
├── modules/
│   ├── network/
│   ├── database/
│   └── application/
└── environments/
    ├── dev.tfvars
    ├── staging.tfvars
    └── production.tfvars
```

**Critères d'évaluation :**
- ✅ Code modulaire et réutilisable
- ✅ Variables paramétrables (pas de valeurs en dur)
- ✅ State management (local backend documenté)
- ✅ Documentation des commandes (README)

---

### Exercice 1.2 — Infrastructure Cloud AWS (Conception)
**Contexte :** AEIG souhaite migrer vers AWS pour bénéficier de la scalabilité cloud.

**Tâches :**
1. Créer un **diagramme d'architecture** (draw.io, Lucidchart, ou ASCII art) montrant :
   - VPC multi-AZ (2 zones de disponibilité)
   - Subnets publics/privés
   - EC2 instances derrière ALB (Application Load Balancer)
   - RDS PostgreSQL Multi-AZ
   - S3 pour stockage statique
   - CloudWatch pour monitoring
   - VPN Site-to-Site vers campus Cotonou

2. Écrire le code Terraform pour **VPC + Subnets uniquement** (pas besoin de déployer réellement) :
   - VPC avec CIDR 10.0.0.0/16
   - 2 subnets publics (10.0.1.0/24, 10.0.2.0/24)
   - 2 subnets privés (10.0.10.0/24, 10.0.11.0/24)
   - Internet Gateway
   - NAT Gateway
   - Route tables

**Livrables :**
```
terraform/aws/
├── architecture-diagram.png (ou .drawio)
├── vpc.tf
├── subnets.tf
├── routing.tf
├── variables.tf
└── README.md (explication des choix)
```

**Critères d'évaluation :**
- ✅ Architecture haute disponibilité
- ✅ Segmentation réseau sécurisée
- ✅ Justification des choix techniques
- ✅ Estimation des coûts (dans README)

---

## 🐳 PARTIE 2 — Orchestration Kubernetes

### Exercice 2.1 — Déploiement Kubernetes Local
**Contexte :** Vous devez conteneuriser et orchestrer les applications AEIG avec Kubernetes.

**Tâches :**
1. Activer Kubernetes dans Docker Desktop
2. Créer les manifestes Kubernetes pour déployer :
   - **Deployment** : Application Node.js (3 replicas)
   - **Service** : ClusterIP pour l'app
   - **Ingress** : Exposition via nginx-ingress
   - **ConfigMap** : Variables d'environnement
   - **Secret** : Credentials DB (base64)
   - **PersistentVolumeClaim** : Stockage pour uploads

3. Implémenter :
   - **Liveness probe** : `/health` endpoint
   - **Readiness probe** : `/ready` endpoint
   - **Resource limits** : CPU 500m, Memory 512Mi
   - **HorizontalPodAutoscaler** : Scale 2-5 replicas si CPU > 70%

**Livrables :**
```
kubernetes/
├── namespace.yaml
├── deployment.yaml
├── service.yaml
├── ingress.yaml
├── configmap.yaml
├── secret.yaml
├── pvc.yaml
├── hpa.yaml
└── README.md (commandes kubectl)
```

**Critères d'évaluation :**
- ✅ Manifestes valides et fonctionnels
- ✅ Bonnes pratiques K8s (labels, selectors)
- ✅ Autoscaling configuré
- ✅ Documentation des tests

---

### Exercice 2.2 — Helm Chart
**Contexte :** Faciliter le déploiement multi-environnements avec Helm.

**Tâches :**
1. Créer un Helm Chart pour l'application :
   - Templates pour tous les manifestes K8s
   - Values.yaml avec paramètres par environnement
   - Helpers pour labels communs

2. Créer 3 fichiers values :
   - `values-dev.yaml` : 1 replica, resources minimales
   - `values-staging.yaml` : 2 replicas
   - `values-prod.yaml` : 3 replicas, resources élevées

**Livrables :**
```
helm/
├── Chart.yaml
├── values.yaml
├── values-dev.yaml
├── values-staging.yaml
├── values-prod.yaml
└── templates/
    ├── deployment.yaml
    ├── service.yaml
    ├── ingress.yaml
    └── _helpers.tpl
```

**Critères d'évaluation :**
- ✅ Chart installable avec `helm install`
- ✅ Paramétrage flexible
- ✅ Documentation Helm

---

## 🌍 PARTIE 3 — Architecture Multi-Campus

### Exercice 3.1 — Stratégie de Réplication
**Contexte :** AEIG a 2 campus (Cotonou, Abidjan) qui doivent partager certaines données.

**Tâches :**
1. Concevoir une architecture de réplication de base de données :
   - Schéma Master-Slave ou Master-Master
   - Diagramme de flux de données
   - Stratégie de résolution de conflits

2. Implémenter avec Docker Compose :
   - 2 conteneurs PostgreSQL (cotonou-db, abidjan-db)
   - Configuration de réplication streaming
   - Script de test de failover

**Livrables :**
```
multi-campus/
├── architecture-replication.md
├── docker-compose-replication.yml
├── postgres-master/
│   └── postgresql.conf
├── postgres-slave/
│   └── postgresql.conf
└── scripts/
    ├── setup-replication.sh
    └── test-failover.sh
```

**Critères d'évaluation :**
- ✅ Réplication fonctionnelle
- ✅ Plan de disaster recovery
- ✅ Documentation des procédures

---

## 📊 PARTIE 4 — Monitoring, Logging & Sécurité

### Exercice 4.1 — Stack d'Observabilité Complète
**Contexte :** Mettre en place une solution de monitoring production-grade.

**Tâches :**
1. Déployer avec Docker Compose :
   - **Prometheus** : Collecte de métriques
   - **Grafana** : Dashboards
   - **Alertmanager** : Alertes (email/webhook simulé)
   - **Loki** : Logs centralisés
   - **Promtail** : Collecteur de logs
   - **Node Exporter** : Métriques système

2. Configurer :
   - Dashboard Grafana avec :
     - CPU/Memory/Disk usage
     - Requêtes HTTP (latency, error rate)
     - Database connections
     - Uptime SLA
   - Règles d'alerte Prometheus :
     - CPU > 80% pendant 5min
     - Error rate > 5%
     - Disk usage > 85%
     - Service down

3. Créer un **runbook** (playbook de réaction) :
   - Procédure si alerte "High CPU"
   - Procédure si alerte "Service Down"
   - Procédure si alerte "Database Slow"

**Livrables :**
```
monitoring/
├── docker-compose-monitoring.yml
├── prometheus/
│   ├── prometheus.yml
│   └── alerts.yml
├── grafana/
│   └── dashboards/
│       └── infrastructure-dashboard.json
├── alertmanager/
│   └── alertmanager.yml
├── loki/
│   └── loki-config.yml
└── runbooks/
    ├── high-cpu.md
    ├── service-down.md
    └── database-slow.md
```

**Critères d'évaluation :**
- ✅ Stack complète fonctionnelle
- ✅ Dashboard pertinent
- ✅ Alertes configurées
- ✅ Runbooks détaillés

---

### Exercice 4.2 — Sécurité & Hardening
**Contexte :** Sécuriser l'infrastructure et les conteneurs.

**Tâches :**
1. Scanner les vulnérabilités :
   - Utiliser **Trivy** pour scanner les images Docker
   - Générer un rapport de vulnérabilités
   - Proposer des correctifs

2. Hardening des conteneurs :
   - Images multi-stage (réduire la surface d'attaque)
   - User non-root dans Dockerfile
   - Read-only filesystem où possible
   - Secrets via Docker secrets (pas d'env vars)

3. Créer un document de **politique de sécurité** :
   - Gestion des secrets (Vault, AWS Secrets Manager)
   - Rotation des credentials
   - Backup & encryption
   - Procédure en cas de breach

**Livrables :**
```
security/
├── trivy-scan-report.txt
├── Dockerfile.hardened
├── docker-compose-secrets.yml
└── security-policy.md
```

**Critères d'évaluation :**
- ✅ Scan de vulnérabilités effectué
- ✅ Dockerfile sécurisé
- ✅ Politique de sécurité complète



## 📦 Livrables Finaux

```
technical-test-lead-infra/
├── terraform/
│   ├── local/          (Exercice 1.1)
│   └── aws/            (Exercice 1.2)
├── kubernetes/         (Exercice 2.1)
├── helm/               (Exercice 2.2)
├── multi-campus/       (Exercice 3.1)
├── network/            (Exercice 3.2)
├── monitoring/         (Exercice 4.1)
├── security/           (Exercice 4.2)
└── README.md           (Instructions globales)
```

---



## 📊 Barème d'Évaluation

| Critère | Points | Détails |
|---------|--------|---------|
| **IaC (Terraform)** | 35% | Modularité, bonnes pratiques, documentation |
| **Orchestration (K8s/Helm)** | 30% | Manifestes valides, scalabilité, autoscaling |
| **Architecture Multi-Campus** | 20% | Réplication, réseau, résilience |
| **Monitoring & Sécurité** | 15% | Observabilité, alertes, hardening |

---

## 🚀 Soumission

1. **Fork** le repository GitHub
2. Créer une branche `lead-infra/<votre-nom>`
3. Commits réguliers avec messages clairs
4. **Pull Request** avec titre : `[Lead Infra] Prénom NOM`
5. Dans la PR, inclure :
   - Résumé des choix techniques
   - Temps passé par partie
   - Difficultés rencontrées
   - Améliorations futures

---

## 📞 Support Technique

En cas de blocage technique (installation, configuration) :
- Documenter le problème dans `ISSUES.md`
- Proposer une solution alternative
- Continuer sur les autres exercices

**Note :** La capacité à débloquer des situations techniques fait partie de l'évaluation.

---

## ✅ Checklist Avant Soumission

- [ ] Tous les fichiers sont versionnés (Git)
- [ ] Pas de secrets/credentials commitées
- [ ] README.md avec instructions claires
- [ ] Code testé et fonctionnel
- [ ] Documentation complète
- [ ] answers-lead.md rempli
- [ ] Pull Request créée

---

**Bonne chance ! 🚀**

*Ce test évalue votre capacité à concevoir, déployer et maintenir une infrastructure robuste pour un environnement éducatif multi-campus. Nous recherchons un profil sénior capable de prendre des décisions architecturales stratégiques.*
