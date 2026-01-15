# Test Technique – Lead Infrastructure & DevOps (5 heures)

## 🎯 Objectif
Évaluer rapidement les compétences essentielles d'un Lead Infrastructure & DevOps pour gérer une infrastructure multi-campus (Cotonou, Abidjan).

**Durée : 5 heures maximum**

---

## 🖥️ Environnement fourni
- PC Windows avec : Docker Desktop (WSL2 + Kubernetes), Terraform, Git, VS Code
- Connexion Internet

---

## 📋 Structure du Test (3 exercices + Questions)

| Partie | Temps | Points |
|--------|-------|--------|
| **Exercice 1** : Infrastructure as Code | 1h30 | 35 |
| **Exercice 2** : Kubernetes & Monitoring | 2h | 40 |
| **Exercice 3** : Architecture Multi-Campus | 1h | 15 |
| **Questions Stratégiques** | 30min | 10 |
| **TOTAL** | **5h** | **100** |

---

## 🏗️ EXERCICE 1 — Infrastructure as Code (1h30 - 35 points)

### Contexte
Créer une infrastructure reproductible pour héberger les plateformes AEIG (LMS, CRM).

### Tâches

#### 1.1 Terraform Local (25 points)
Créer une infrastructure Terraform qui provisionne **localement via Docker** :

**Ressources à créer :**
- 1 réseau Docker privé (`aeig-network`)
- 1 conteneur PostgreSQL avec volume persistant
- 2 conteneurs applicatifs (web-cotonou, web-abidjan) basés sur nginx
- Variables paramétrables (pas de valeurs en dur)

**Structure attendue :**
```
terraform/
├── main.tf
├── variables.tf
├── outputs.tf
└── terraform.tfvars.example
```

**Commandes à documenter dans README.md :**
```bash
terraform init
terraform plan
terraform apply
terraform destroy
```

**Critères d'évaluation :**
- ✅ Code fonctionnel (terraform apply sans erreur) : 10 pts
- ✅ Variables paramétrables : 5 pts
- ✅ Outputs utiles (IPs, ports) : 3 pts
- ✅ Volume persistant DB : 4 pts
- ✅ Documentation claire : 3 pts

---

#### 1.2 Architecture Cloud AWS (10 points)
Concevoir l'architecture pour migrer vers AWS.

**Livrables :**
1. **Diagramme d'architecture** (draw.io, Lucidchart, ou schéma texte) montrant :
   - VPC avec 2 subnets publics + 2 privés
   - ALB (Application Load Balancer)
   - EC2 instances
   - RDS PostgreSQL Multi-AZ
   - VPN vers campus Cotonou

2. **Document architecture.md** expliquant :
   - Choix techniques (pourquoi Multi-AZ, ALB, etc.)
   - Estimation coûts mensuelle (approximative)
   - Stratégie haute disponibilité

**Critères d'évaluation :**
- ✅ Diagramme complet : 5 pts
- ✅ Justifications pertinentes : 3 pts
- ✅ Estimation coûts : 2 pts

---

## 🐳 EXERCICE 2 — Kubernetes & Monitoring (2h - 40 points)

### Contexte
Déployer une application sur Kubernetes local avec monitoring.

### Tâches

#### 2.1 Déploiement Kubernetes (25 points)

**Créer les manifestes K8s pour :**

1. **Namespace** : `aeig-prod`

2. **Deployment** :
   - Image : `nginx:alpine`
   - 3 replicas
   - Labels : `app=aeig-web`, `env=prod`
   - Liveness probe : `/` (HTTP GET port 80)
   - Readiness probe : `/` (HTTP GET port 80)
   - Resources : CPU 200m, Memory 256Mi

3. **Service** :
   - Type : ClusterIP
   - Port : 80

4. **ConfigMap** :
   - Variables : `CAMPUS=Cotonou`, `ENV=production`

5. **HorizontalPodAutoscaler** :
   - Min : 2, Max : 5
   - Target CPU : 70%

**Structure attendue :**
```
kubernetes/
├── namespace.yaml
├── deployment.yaml
├── service.yaml
├── configmap.yaml
├── hpa.yaml
└── README.md (commandes kubectl)
```

**Critères d'évaluation :**
- ✅ Manifestes valides (kubectl apply fonctionne) : 10 pts
- ✅ Probes configurées : 5 pts
- ✅ HPA fonctionnel : 5 pts
- ✅ Application accessible : 3 pts
- ✅ Documentation : 2 pts

---

#### 2.2 Monitoring Stack (15 points)

**Déployer avec Docker Compose :**
- Prometheus (collecte métriques)
- Grafana (visualisation)
- Node Exporter (métriques système)

**Fichier : `monitoring/docker-compose.yml`**

**Configuration Prometheus :**
- Scraper Node Exporter toutes les 15s
- 1 règle d'alerte : CPU > 80% pendant 5min

**Dashboard Grafana :**
- Importer un dashboard Node Exporter (ID: 1860)
- Documenter l'accès (URL, credentials)

**Critères d'évaluation :**
- ✅ Stack démarrée (docker-compose up) : 7 pts
- ✅ Prometheus scrape Node Exporter : 4 pts
- ✅ Grafana accessible avec dashboard : 4 pts

---

## 🌍 EXERCICE 3 — Architecture Multi-Campus (1h - 15 points)

### Contexte
Concevoir la stratégie pour connecter 2 campus (Cotonou, Abidjan).

### Tâches

#### 3.1 Plan Réseau (8 points)

**Créer un document `network-plan.md` avec :**

1. **Plan d'adressage IP :**
   - Campus Cotonou : 10.1.0.0/16
   - Campus Abidjan : 10.2.0.0/16
   - Segmentation VLAN :
     - VLAN 10 : Administration
     - VLAN 20 : Étudiants
     - VLAN 30 : Serveurs
     - VLAN 40 : IoT

2. **Architecture VPN Site-to-Site :**
   - Type : IPsec ou WireGuard
   - Schéma de connexion
   - Firewall rules principales

**Critères d'évaluation :**
- ✅ Plan d'adressage cohérent : 4 pts
- ✅ Segmentation VLAN justifiée : 2 pts
- ✅ Architecture VPN claire : 2 pts

---

#### 3.2 Réplication Base de Données (7 points)

**Créer un document `database-replication.md` avec :**

1. **Stratégie de réplication :**
   - Master-Slave ou Master-Master ?
   - Justification du choix
   - Schéma de flux de données

2. **Plan Disaster Recovery :**
   - RPO (Recovery Point Objective) : < 1h
   - RTO (Recovery Time Objective) : < 4h
   - Procédure de failover (étapes)

3. **Backup Strategy :**
   - Fréquence des backups
   - Rétention (combien de jours)
   - Stockage (local + cloud)

**Critères d'évaluation :**
- ✅ Stratégie réplication pertinente : 3 pts
- ✅ Plan DR réaliste : 2 pts
- ✅ Backup strategy complète : 2 pts

---

## 🎤 QUESTIONS STRATÉGIQUES (30min - 10 points)

Répondre dans `answers.md` (5-10 lignes par question) :

### Q1 : Scalabilité Multi-Campus (2 points)
AEIG prévoit d'ouvrir 3 nouveaux campus dans 2 ans. Comment architectureriez-vous l'infrastructure pour supporter cette croissance ? (Considérer : coûts, latence, gestion centralisée)

### Q2 : CI/CD Sans Interruption (2 points)
Comment déployez-vous une mise à jour du LMS utilisé par 5000 étudiants sans interruption de service ? (Stratégie de déploiement)

### Q3 : Optimisation Coûts Cloud (2 points)
Quelles 3 actions concrètes mettriez-vous en place pour réduire de 30% les coûts AWS tout en maintenant la performance ?

### Q4 : Incident Management (2 points)
Le site web de l'école subit une attaque DDoS. Décrivez votre processus de réponse (5 étapes principales).

### Q5 : Organisation Équipe (2 points)
Comment structureriez-vous une équipe infrastructure/DevOps pour gérer 3 campus ? (Rôles, responsabilités, on-call)

---

## 📦 Livrables Finaux

```
technical-test-lead-infra-5h/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── terraform.tfvars.example
│   └── README.md
├── architecture/
│   ├── aws-architecture-diagram.png (ou .drawio)
│   └── architecture.md
├── kubernetes/
│   ├── namespace.yaml
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── configmap.yaml
│   ├── hpa.yaml
│   └── README.md
├── monitoring/
│   ├── docker-compose.yml
│   ├── prometheus/
│   │   └── prometheus.yml
│   └── README.md
├── multi-campus/
│   ├── network-plan.md
│   └── database-replication.md
├── answers.md
└── README.md (instructions globales)
```

---

## ⏱️ Planning Recommandé

| Temps | Activité |
|-------|----------|
| 0h00 - 0h10 | Lecture du test, setup environnement |
| 0h10 - 1h40 | **Exercice 1** : Terraform + Architecture AWS |
| 1h40 - 3h40 | **Exercice 2** : Kubernetes + Monitoring |
| 3h40 - 4h40 | **Exercice 3** : Multi-Campus (réseau + DB) |
| 4h40 - 5h00 | **Questions** + Relecture |

---

## 📊 Barème d'Évaluation

### Score Total : 100 points

| Exercice | Points | Détails |
|----------|--------|---------|
| **Exercice 1** | 35 | Terraform (25) + Architecture AWS (10) |
| **Exercice 2** | 40 | Kubernetes (25) + Monitoring (15) |
| **Exercice 3** | 15 | Réseau (8) + Réplication DB (7) |
| **Questions** | 10 | 5 questions × 2 points |

### Interprétation

| Score | Niveau | Décision |
|-------|--------|----------|
| 85-100 | **Excellent** | ✅ Recommandé fortement |
| 70-84 | **Très bon** | ✅ Recommandé |
| 55-69 | **Bon** | ⚠️ À discuter |
| < 55 | **Insuffisant** | ❌ Non recommandé pour Lead |

---

## 🚨 Critères Éliminatoires

- ❌ Secrets/credentials commitées dans Git
- ❌ Aucun exercice complété (< 30 points)
- ❌ Plagiat évident

---

## 🚀 Soumission

1. **Fork** le repository
2. Créer une branche `lead-infra-5h/<prenom-nom>`
3. Commits réguliers
4. **Pull Request** avec titre : `[Lead Infra 5h] Prénom NOM`
5. Dans la PR, inclure :
   - Temps réel passé
   - Difficultés rencontrées
   - Ce que vous auriez amélioré avec plus de temps

---

## ✅ Checklist Avant Soumission

- [ ] Terraform fonctionne (`terraform apply`)
- [ ] Kubernetes déployé (`kubectl get pods`)
- [ ] Monitoring accessible (Grafana)
- [ ] Documents architecture créés
- [ ] answers.md complété
- [ ] README.md avec instructions
- [ ] Pas de secrets commitées
- [ ] Pull Request créée

---

## 💡 Conseils

### Priorisation
Si vous manquez de temps, priorisez dans cet ordre :
1. **Exercice 1.1** (Terraform) - Essentiel
2. **Exercice 2.1** (Kubernetes) - Essentiel
3. **Questions** - Rapide et valorisant
4. **Exercice 2.2** (Monitoring) - Important
5. **Exercice 3** (Architecture) - Conceptuel
6. **Exercice 1.2** (AWS) - Bonus

### Efficacité
- Utilisez des templates/exemples existants (documentez vos sources)
- Commentez votre code pour gagner du temps sur la doc
- Testez au fur et à mesure (ne pas tout faire puis tester)
- Si un exercice bloque, passez au suivant

### Documentation
- README minimal mais clair
- Commandes essentielles pour reproduire
- Expliquez vos choix techniques

---

## 📞 Support Technique

En cas de blocage :
- Documenter le problème dans votre README
- Proposer une solution alternative
- Continuer sur les autres exercices

**La capacité à gérer les imprévus fait partie de l'évaluation.**

---

**Bonne chance ! 🚀**

*Ce test évalue votre capacité à livrer rapidement une infrastructure fonctionnelle tout en démontrant une vision stratégique.*
