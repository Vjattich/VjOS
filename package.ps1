git pull
if (Test-Path -Path '.\VjOS.apbx' -PathType Leaf) {
     rm '.\VjOS.apbx'
}
& 'C:\Program Files\7-Zip\7z.exe' a -tzip -mx5 -r0 '.\VjOS.apbx' '.\Configuration' '.\Executables' '.\Localizations' '.\Manifest' '.\Module' '.\playbook.conf' '.\playbook.png'