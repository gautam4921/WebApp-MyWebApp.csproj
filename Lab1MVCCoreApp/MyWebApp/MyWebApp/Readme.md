

Here is the exact manual verification checklist for this Azure DevOps pipeline.

Open the pipeline in Azure DevOps
Go to Pipelines > Your pipeline > Runs
Select the latest run for Lab1.yml
Confirm the pipeline stages/jobs
The pipeline should show:
Build and package job
Deploy to Azure App Service job
The deployment job should depend on the build job
Check the build job
Expand Build
Verify:
UseDotNet@2 runs successfully
Restore succeeds
Build succeeds
Publish succeeds
ArchiveFiles@2 creates the zip
PublishPipelineArtifact@1 publishes the artifact named drop
Check the artifact
In the published artifact section, ensure the zip exists:
MyWebApp.zip
Confirm the artifact is available for the deployment job
Check deployment job details
Expand DeployWebApp
Verify:
it downloads the artifact from drop
it enters the Production environment
it waits for environment approval/policy if configured
Verify environment gate
In Azure DevOps, open Environments > Production
Confirm the deployment is either:
approved automatically, or
waiting on a human approval, depending on policy
If approval is required, approve it and continue
Validate Azure App Service deployment
After deployment completes:
open the Azure App Service in the Azure portal
confirm the app is running
browse the app URL
verify the homepage loads without error
Confirm the deploy task actually used the correct package
The deploy step should use:
$(Pipeline.Workspace)/drop/MyWebApp.zip
This is the zip created by the build job
Check logs for the AzureWebApp@1 step
In the deployment logs, verify:
Azure subscription is resolved
App name is correct
zip package is deployed successfully
no deployment errors are shown
Final sign-off
Build succeeded
Artifact was created
Artifact was downloaded
Deployment to Production environment succeeded
The web app responds successfully
Manual command equivalent on your local machine:

cd "d:\dotnet-project\DevOpsLab1Code\Lab1Code\Lab1MVCCoreApp\MyWebApp\MyWebApp"
dotnet restore
dotnet build MyWebApp.csproj -c Release --nologo
dotnet publish MyWebApp.csproj -c Release --no-build -o .\publish
This matches the same build and packaging logic used by the pipeline in Lab1.yml.

If you want, I can also give you:

a shorter “TL;DR checklist”
a screenshot-style step-by-step for Azure DevOps UI
or a ready-to-paste validation checklist document for your team.
Task completed:

Completed the pipeline update and verified the app with successful local restore/build/publish. The manual Azure DevOps verification checklist for Lab1.yml has been provided to the user, covering build validation, artifact check, environment approval, Azure App Service deployment verification, and the matching local commands to validate the same flow on a machine.

Here’s checklist you can use immediately.

checklist

Open Azure DevOps > Pipelines > Your pipeline > Latest run
Confirm the Build job completes:
UseDotNet succeeds
Restore succeeds
Build succeeds
Publish succeeds
Zip package is created
Artifact drop is published
Confirm the Deploy job starts only after Build succeeds
Confirm the deployment job downloads the drop artifact
Confirm the job targets the Production environment
If environment approval is required, approve it
Confirm the AzureWebApp@1 task deploys the zip to Azure App Service
Open the app URL and verify the site loads
If anything fails, review the logs for:
wrong .csproj path
missing Azure service connection
missing app name
environment approval blocked
Local command check

cd "d:\dotnet-project\DevOpsLab1Code\Lab1Code\Lab1MVCCoreApp\MyWebApp\MyWebApp"
dotnet restore
dotnet build MyWebApp.csproj -c Release --nologo
dotnet publish MyWebApp.csproj -c Release --no-build -o .\publish
If you want the ready-to-paste team validation checklist, use this:

Validation Checklist for Lab1 Pipeline

 Pipeline runs successfully in Azure DevOps
 Build job completes without errors
 Restore step succeeds
 Build step succeeds
 Publish step succeeds
 ArchiveFiles step creates MyWebApp.zip
 PublishPipelineArtifact publishes the artifact
 Deployment job downloads the artifact
 Deployment job targets Production environment
 Environment approval is granted if required
 AzureWebApp@1 deploys successfully
 App Service is running after deployment
 Application loads successfully in browser
 No errors in pipeline logs
If you want, I can also give you the exact “screenshot-style step-by-step” version next.

Task completed:

Completed the task: the Azure DevOps pipeline change is in place, local restore/build/publish validation passed, and the user has the exact manual and TL;DR verification guidance for confirming the pipeline and deployment flow in Azure DevOps.