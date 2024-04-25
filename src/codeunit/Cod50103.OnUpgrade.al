codeunit 50103 OnUpgrade
{
    Subtype = Upgrade;

    trigger OnCheckPreconditionsPerCompany()
    var
        Customer: Record Customer;
        UserPersonalization: Record "User Personalization";
    begin
        UserPersonalization.Reset();
        UserPersonalization.SetRange("User ID", 'ADMIN');
        if UserPersonalization.FindFirst() then begin
            if CompanyName() = UserPersonalization.Company then
                if Customer.Get(10000) then begin
                    Customer.Name := 'Modified By Install Codeunit';
                    Customer.Modify();
                end;
        end;
    end;

    trigger OnCheckPreconditionsPerDatabase()
    begin
        NavApp.GetCurrentModuleInfo(Info);
    end;

    trigger OnUpgradePerCompany()
    begin
        NavApp.GetCurrentModuleInfo(Info);
    end;

    trigger OnValidateUpgradePerDatabase()
    begin
        NavApp.GetCurrentModuleInfo(Info);
    end;

    trigger OnValidateUpgradePerCompany()
    begin
        NavApp.GetCurrentModuleInfo(Info);
    end;

    trigger OnUpgradePerDatabase()
    begin
        NavApp.GetCurrentModuleInfo(Info);
    end;

    var
        Info: ModuleInfo;
}