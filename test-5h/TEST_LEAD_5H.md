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

| Partie | Temps estimé| Points |
|--------|-------|--------|
| **Exercice 1** : Infrastructure as Code | 1h30 | 35 |
| **Exercice 2** : Kubernetes & Monitoring | 2h | 40 |
| **Exercice 3** : Architecture Multi-Campus | 1h | 15 |
| **TOTAL** | **5h** | **100** |

---

## 🏗️ EXERCICE 1 — Infrastructure as Code 

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


---

#### 1.2 Architecture Cloud AWS 
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

## 🐳 EXERCICE 2 — Kubernetes & Monitoring (2h)

### Contexte
Déployer une application sur Kubernetes local avec monitoring.

### Tâches

#### 2.1 Déploiement Kubernetes 

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

## 🚨 Critères Éliminatoires

- ❌ Secrets/credentials commitées dans Git
- ❌ Aucun exercice complété 
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
