Infrastructure
==============

Project Structure
-----------------
* Scribestar-Infrastructure
    * Environment
        * Test (Env specific config)
            * App.csv (App server config)
            * Web.csv (Web server config)
            * etc...
            * Create-VM.ps1 (VM creation script)
        * CI
        * Alpha
        * etc...
    * Modules (Reusable powershell modules)
        * Scribestar-Functions.psm1
        * etc...
    Infrastructure.nuspec (The main nuspec file)
    Scribestar-Infrastructure.csproj (Visual studio project file)
