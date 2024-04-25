codeunit 50102 OnInstall
{
    Subtype = Install;
    trigger OnInstallAppPerCompany()
    var
        Info: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(Info);
    end;

    // trigger OnInstallAppPerDatabase()
    // var
    //     Item: Record Item;
    // begin
    //     Item.Init();
    //     Item."No." := '1997';
    //     Item.Description := 'Item From Install Codeunit';
    //     Item.Insert();
    // end;
}