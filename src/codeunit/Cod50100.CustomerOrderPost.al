codeunit 50100 CustomerOrderPost
{
    TableNo = CustomerOrderHeader;
    trigger OnRun()
    var
        CustomerOrderHeader: Record CustomerOrderHeader;
    begin
        CustomerOrderHeader.Copy(Rec);
        Code(CustomerOrderHeader);
        CustomerOrderHeader.Delete(true);
    end;

    local procedure Code(var CustomerOrderHeader: Record CustomerOrderHeader)
    var
        CustomerOrderHeaderPosted: Record CustomerOrderHeaderPosted;
        NoSeries: Codeunit "No. Series";
        HenriqueAppSetup: Record HenriqueAppSetup;
        CustomerOrderLine: Record CustomerOrderLine;
        CustomerOrderLinePosted: Record CustomerOrderLinePosted;
        IsHandled: Boolean;
        CustomerOrderHeaderPostedPage: Page CustomerOrderHeaderPosted;
    begin
        OnBeforeCode(CustomerOrderHeader, IsHandled);
        if IsHandled then
            exit;

        CustomerOrderLine.SetRange(DocumentNo, CustomerOrderHeader.No);
        if CustomerOrderLine.FindSet() then begin
            CustomerOrderHeader.CalcFields(OrderAmountValue);
            CustomerOrderHeaderPosted.TransferFields(CustomerOrderHeader);
            CustomerOrderHeaderPosted.Validate(AmountToPay, CustomerOrderHeader.OrderAmountValue);
            HenriqueAppSetup.Get();
            CustomerOrderHeaderPosted.Validate(No, NoSeries.GetNextNo(HenriqueAppSetup.SerialNoPosted));
            CustomerOrderHeaderPosted.Validate(OldDocNo, CustomerOrderHeader.No);
            CustomerOrderHeaderPosted.Insert();
            repeat
                CustomerOrderLinePosted.TransferFields(CustomerOrderLine);
                CustomerOrderLinePosted.Validate(DocumentNo, CustomerOrderHeaderPosted.No);
                CustomerOrderLinePosted.Insert();
            until CustomerOrderLine.Next() = 0;
            if Confirm('Do you want to open the Posted Customer Order %1?', true, CustomerOrderHeaderPosted.No) then begin
                CustomerOrderHeaderPostedPage.SetRecord(CustomerOrderHeaderPosted);
                CustomerOrderHeaderPostedPage.Run();
            end;
        end;
        OnAfterCode(CustomerOrderHeader);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCode(var Rec: Record CustomerOrderHeader; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCode(var Rec: Record CustomerOrderHeader)
    begin
    end;


}