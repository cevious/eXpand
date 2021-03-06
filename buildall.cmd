@echo on

call defines.bat

if exist eXpand.Key\eXpand.snk goto build
echo Generating strong key
mkdir eXpand.Key
%sn% -k eXpand.Key\eXpand.snk

:build
call buildproject.cmd eXpand.Utils ".\eXpand\eXpand.Utils\eXpand.Utils.csproj"
call buildproject.cmd eXpand.Xpo ".\eXpand\eXpand.Xpo\eXpand.Xpo.csproj"
call buildproject.cmd eXpand.Persistent.Base ".\eXpand\eXpand.Persistent\eXpand.Persistent.Base\eXpand.Persistent.Base.csproj"
call buildproject.cmd eXpand.ExpressApp ".\eXpand\eXpand.ExpressApp\eXpand.ExpressApp\eXpand.ExpressApp.csproj"
call buildproject.cmd eXpand.ExpressApp.Win ".\eXpand\eXpand.ExpressApp\eXpand.ExpressApp.Win\eXpand.ExpressApp.Win.csproj"
call buildproject.cmd eXpand.ExpressApp.Web ".\eXpand\eXpand.ExpressApp\eXpand.ExpressApp.Web\eXpand.ExpressApp.Web.csproj"
call buildproject.cmd eXpand.ExpressApp.Security ".\eXpand\eXpand.ExpressApp.Modules\Security\eXpand.ExpressApp.Security.csproj"
call buildproject.cmd eXpand.ExpressApp.Validation ".\eXpand\eXpand.ExpressApp.Modules\Validation\eXpand.ExpressApp.Validation.csproj"
call buildproject.cmd eXpand.ExpressApp.AdditionalViewControlsProvider ".\eXpand\eXpand.ExpressApp.Modules\AdditionalViewControlsProvider\eXpand.ExpressApp.AdditionalViewControlsProvider.csproj"
call buildproject.cmd eXpand.ExpressApp.AdditionalViewControlsProvider.Win ".\eXpand\eXpand.ExpressApp.Modules\AdditionalViewControlsProvider.Win\eXpand.ExpressApp.AdditionalViewControlsProvider.Win.csproj"
call buildproject.cmd eXpand.ExpressApp.AdditionalViewControlsProvider.Web ".\eXpand\eXpand.ExpressApp.Modules\AdditionalViewControlsProvider.Web\eXpand.ExpressApp.AdditionalViewControlsProvider.Web.csproj"
call buildproject.cmd eXpand.ExpressApp.ModelDifference ".\eXpand\eXpand.ExpressApp.Modules\ModelDifference\eXpand.ExpressApp.ModelDifference.csproj"
call buildproject.cmd eXpand.ExpressApp.ModelDifference.Win ".\eXpand\eXpand.ExpressApp.Modules\ModelDifference.Win\eXpand.ExpressApp.ModelDifference.Win.csproj"
call buildproject.cmd eXpand.ExpressApp.ModelDifference.Web ".\eXpand\eXpand.ExpressApp.Modules\ModelDifference.Web\eXpand.ExpressApp.ModelDifference.Web.csproj"
call buildproject.cmd eXpand.ExpressApp.FilterDataStore ".\eXpand\eXpand.ExpressApp.Modules\FilterDataStore\eXpand.ExpressApp.FilterDataStore.csproj"
call buildproject.cmd eXpand.ExpressApp.FilterDataStore.Win ".\eXpand\eXpand.ExpressApp.Modules\FilterDataStore.Win\eXpand.ExpressApp.FilterDataStore.Win.csproj"
call buildproject.cmd eXpand.ExpressApp.ModelArtifactState ".\eXpand\eXpand.ExpressApp.Modules\ModelArtifactState\eXpand.ExpressApp.ModelArtifactState.csproj"
call buildproject.cmd eXpand.ExpressApp.ModelArtifactState.Win ".\eXpand\eXpand.ExpressApp.Modules\ModelArtifactState.Win\eXpand.ExpressApp.ModelArtifactState.Win.csproj"
call buildproject.cmd eXpand.ExpressApp.WizardUI.Win ".\eXpand\eXpand.ExpressApp.Modules\WizardUI.Win\eXpand.ExpressApp.WizardUI.Win.csproj"
call buildproject.cmd eXpand.ExpressApp.ViewVariants ".\eXpand\eXpand.ExpressApp.Modules\ViewVariants\eXpand.ExpressApp.ViewVariants.csproj"
call buildproject.cmd eXpand.ExpressApp.ViewVariants.Win ".\eXpand\eXpand.ExpressApp.Modules\ViewVariants.Win\eXpand.ExpressApp.ViewVariants.Win.csproj"
call buildproject.cmd eXpand.ExpressApp.TreeListEditors.Win ".\eXpand\eXpand.ExpressApp.Modules\TreeListEditors.Win\eXpand.ExpressApp.TreeListEditors.Win.csproj"
call buildproject.cmd eXpand.ExpressApp.ExceptionHandling ".\eXpand\eXpand.ExpressApp.Modules\ExceptionHandling\eXpand.ExpressApp.ExceptionHandling.csproj"
call buildproject.cmd eXpand.ExpressApp.ExceptionHandling.Win ".\eXpand\eXpand.ExpressApp.Modules\ExceptionHandling.Win\eXpand.ExpressApp.ExceptionHandling.Win.csproj"
call buildproject.cmd eXpand.ExpressApp.ExceptionHandling.Web ".\eXpand\eXpand.ExpressApp.Modules\ExceptionHandling.Web\eXpand.ExpressApp.ExceptionHandling.Web.csproj"
call buildproject.cmd eXpand.ExpressApp.Taxonomies ".\eXpand\eXpand.ExpressApp.Modules\Taxonomies\eXpand.ExpressApp.Taxonomies.csproj"
call buildproject.cmd eXpand.ExpressApp.WorldCreator ".\eXpand\eXpand.ExpressApp.Modules\WorldCreator\eXpand.ExpressApp.WorldCreator.csproj"
call buildproject.cmd eXpand.ExpressApp.WorldCreator.Win ".\eXpand\eXpand.ExpressApp.Modules\WorldCreator.Win\eXpand.ExpressApp.WorldCreator.Win.csproj"
call buildproject.cmd eXpand.ExpressApp.WorldCreator.Web ".\eXpand\eXpand.ExpressApp.Modules\WorldCreator.Web\eXpand.ExpressApp.WorldCreator.Web.csproj"
call buildproject.cmd eXpand.Persistent.BaseImpl ".\eXpand\eXpand.Persistent\eXpand.Persistent.BaseImpl\eXpand.Persistent.BaseImpl.csproj"

%msbuild% /nologo /t:Rebuild /verbosity:quiet /p:Configuration=%configuration% ".\eXpand.AddIns\eXpandAddIns.csproj"
%msbuild% /nologo /t:Rebuild /verbosity:quiet /p:Configuration=%configuration% ".\eXpand.AddIns\DevExpress.ExpressApp.ModelEditor\DevExpress.ExpressApp.ModelEditor.csproj"

%sn% -q -T eXpand.Dll\eXpand.Utils.dll > PublicKeyToken.txt

pause
