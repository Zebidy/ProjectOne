Clear-Host

$ProjectName = "02Lance"
$ProjectType = "mvc"                  # dotnet new list  To see available options.
$AuthenticationType = "individual"    # none,individual,single,windows
$HttpPort = "5000"
$HttpsPort = "5001"

# Creating the Project using the Web template
dotnet new globaljson --output "$ProjectName-Sln/$ProjectName"
dotnet new $ProjectType --auth $AuthenticationType --kestrelHttpPort $HttpPort --kestrelHttpsPort $HttpsPort --output "$ProjectName-Sln/$ProjectName"

# Create the Solution to contain the Projects
dotnet new sln --output "$ProjectName-Sln"
dotnet sln "$ProjectName-Sln" add "$ProjectName-Sln/$ProjectName"

# Create the Unit Test Project
dotnet new xunit --output "$ProjectName-Sln/$ProjectName.Tests"
dotnet sln "$ProjectName-Sln" add "$ProjectName-Sln/$ProjectName.Tests"
dotnet add "$ProjectName-Sln/$ProjectName.Tests" reference "$ProjectName-Sln/$ProjectName"

# Install the Moq package to support Unit Tests
dotnet add "$ProjectName-Sln/$ProjectName.Tests" package Moq


# Add EF package to the project
dotnet add package Microsoft.EntityFrameworkCore.Design
dotnet add package Microsoft.EntityFrameworkCore.SqlServer


<#
Clear-Host

$Name = "ADGroupManager"

dotnet new globaljson --output $Name

dotnet new web --output $Name

dotnet new sln -o $Name

dotnet sln $Name add $Name

# Post - Create Steps

#1. Change PS dir to $Name

#2.  Open $Name\Properties\launchSettings.json
#    change the HTTP port to 5000
#    disable automatic browser launch.

#3. Add Entity Framework NuGetPackages to the Project
#   dotnet add package Microsoft.EntityFrameworkCore.Design
#   dotnet add package Microsoft.EntityFrameworkCore.SqlServer

#  IF NOT ALREADY INSTALLED ON DEV COMPUTER
#  Install the Global Tool Package for Entity Framework.
#  CHECK : dotnet tool list --global
#  dotnet tool install --global dotnet-ef
#  e.g.
#  Package Id                            Version      Commands 
#  ------------------------------------------------------------
#  dotnet-ef                             7.0.4        dotnet-ef
#  microsoft.dotnet-httprepl             6.0.0        httprepl
#  microsoft.web.librarymanager.cli      2.1.175      libman

#>