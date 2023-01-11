<#
.SYNOPSIS
Menu

.DESCRIPTION
Menu qui demande à l'utilisateur de faire son choix entre l'option 
"Trier les éléments de votre bureau en dossiers en fonction des extensions" & "Créer une statistique d'un dossier"
Une fois le choix fait, le menu va appelé le fichier concernant l'option choisie
#>

# Différents choix du menu
$options = @(
    "Trier les éléments de votre bureau en dossiers en fonction des extensions",
    "Créer une statistique d'un dossier",
    "Quitter"
)
    # Afficher le menu
    Write-Host "Choisissez une option :" 
    for ($i = 0; $i -lt $options.Count; $i++) {
        Write-Host "  $($i + 1). $($options[$i])"
    }

    # Demander à l'utilisateur de choisir une option
    $choix = Read-Host "Entrez votre choix (1 - $($options.Count))"

    # Exécuter l'option choisie
    switch ($choix) {
        # choix 1
        1 {
            # Appeler le fichier associé à ce choix
            .\sorting-desktop.ps1
        }
        # choix 2
        2 {
            # Appeler le fichier associé à ce choix
            .\stats.ps1
        }
        # Quitter
        3 {
            if ($choix -eq 3) {
                Write-Host "Le programme a été fermé."
                Exit
            }
        }
        # Choix incorrect
        default {
            Write-Host "Votre choix est incorrect. Veuillez réessayer."
        }
        
    }

    