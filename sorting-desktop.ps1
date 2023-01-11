<#
.SYNOPSIS
Gestion automatique des fichiers présents sur le bureau

.DESCRIPTION
Le script permet de trier les fichiers en dossiers en fonction de leur extension
#>

# Indiquer dans la variable $desktop le chemin du bureau
$desktop = "C:\Users\$env:username\Desktop"

# Indiquer les extensions de fichier dans des variables correspondant aux logiciels word, powerpoint, excel
$word = @('docx','docm','dotx','dotm')
$powerpoint = @('pptx','pptm','potx','potm','ppam')
$excel = @('xlsx')

# Récupérer tous les éléments présents sur le bureau de l'utilisateur
$files = Get-ChildItem -Path $desktop

foreach ($item in $files) {
    
    # Vérifier si l'extension du fichier est contenue dans $word
    if ($word.Contains($item.Extension.TrimStart('.'))) {
        # Crée le chemin "Documents/Microsoft Office/Word" s'il n'existe pas déjà
        New-Item -ItemType Directory -Path "$desktop\Documents\Microsoft Office\Word" -ErrorAction Ignore
        # Déplace le fichier dans le dossier Word
        Move-Item -Path $item.FullName -Destination "$desktop\Documents\Microsoft Office\Word"
    }

    # Vérifier si l'extension du fichier est contenue dans $powerpoint
    elseif ($powerpoint.Contains($item.Extension.TrimStart('.'))) {
        # Crée le chemin "Documents/Microsoft Office/Powerpoint" s'il n'existe pas déjà
        New-Item -ItemType Directory -Path "$desktop\Documents\Microsoft Office\Powerpoint" -ErrorAction Ignore
        # Déplace le fichier dans le dossier Powerpoint
        Move-Item -Path $item.FullName -Destination "$desktop\Documents\Microsoft Office\Powerpoint"
    }

    # Vérifier si l'extension du fichier est contenue dans $excel
    elseif ($excel.Contains($item.Extension.TrimStart('.'))) {
        # Crée le chemin "Documents/Microsoft Office/Excel" s'il n'existe pas déjà
        New-Item -ItemType Directory -Path "$desktop\Documents\Microsoft Office\Excel" -ErrorAction Ignore
        # Déplace le fichier dans le dossier Excel
        Move-Item -Path $item.FullName -Destination "$desktop\Documents\Microsoft Office\Excel"
    }
    elseif($item.Directory){
        New-Item -ItemType Directory -Path $desktop -Name "Autres" -ErrorAction Ignore
        # Déplace les autres fichiers dans un dossier autres
        Move-Item -Path $item.FullName -Destination "$desktop/Autres"
        }    
}

