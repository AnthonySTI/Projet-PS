<#
.SYNOPSIS
Créer une statistique d'un dossier

.DESCRIPTION
Le script pour afficher les statistiques d'un répertoire est capable d'afficher les fichiers d'un dossier,
de compter le nombre de fichiers présents dans un dossier et d'afficher la taille d'un répertoire en giga-octets. 
#>

# Chargement des classes l'interface GUI
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing


# Demande à l'utilisateur le chemin du dossier à analyser
$FolderPath = New-Object System.Windows.Forms.FolderBrowserDialog #Création du dialogue pour la séléction du chemin
$FolderPath.ShowDialog() # Affiche la page de dialogue pour la séléction du chemin
$FolderPath.SelectedPath = $path

# Options du menu
$options = @(
    "Afficher les éléments du dossier",
    "Afficher le nombre d'éléments présents dans le dossier",
    "Afficher la taille du dossier en GO",
    "Quitter"
)

# Affiche le menu
Write-Host "Que souhaites-tu afficher ?"
for ($i = 0; $i -lt $options.Count; $i++) {
    Write-Host "  $($i + 1). $($options[$i])"
}

# Demande à l'utilisateur d'entrer son choix
$choix = Read-Host "Entre ton choix (1 - $($options.Count))"

# Exécute l'option choisie
switch ($choix) {
    # Option 1
    1 {
        # Appelle la commande associée à ce choix
        Get-ChildItem -Path $path
    }
    # Option 2
    2 {
        # Appelle la commande associée à ce choix
        $nombre = (Get-ChildItem -Path $path).Count
        Write-Host $nombre "fichiers / dossiers"
    }
    # Option 3
    3 {
        # Appelle la commande associée à ce choix
        $tailleEnOctets = (Get-ChildItem -Path $path -Recurse | Measure-Object -Property Length -Sum).Sum
        $tailleEnGigaOctets = [math]::Round($tailleEnOctets / 1gb, 2)
        Write-Host $tailleEnGigaOctets "Go"
    }
    # Quitter
    4 {
        if ($choix -eq 4) {
            Write-Host "Le programme a été fermé."
            Exit
        }
    }
    # Choix Incorrect
    default {
        Write-Host "Votre choix est incorrect. Veuillez réessayer."
    }  
}

