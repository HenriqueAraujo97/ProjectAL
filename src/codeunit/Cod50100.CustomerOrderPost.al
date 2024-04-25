codeunit 50100 CustomerOrderPost
{
    TableNo = CustomerOrderHeader;
    trigger OnRun()
    var
        CustomerOrderHeaderPosted: Record CustomerOrderHeaderPosted;
        NoSeries: Codeunit "No. Series";
        HenriqueAppSetup: Record HenriqueAppSetup;
        CustomerOrderLine: Record CustomerOrderLine;
        CustomerOrderLinePosted: Record CustomerOrderLinePosted;
    begin
        CustomerOrderLine.SetRange(DocumentNo, Rec.No);
        if CustomerOrderLine.FindSet() then begin
            Rec.CalcFields(OrderAmountValue);
            CustomerOrderHeaderPosted.AmountPaid := Rec.OrderAmountValue;
            CustomerOrderHeaderPosted.TransferFields(Rec);
            HenriqueAppSetup.Get();
            CustomerOrderHeaderPosted.No := NoSeries.GetNextNo(HenriqueAppSetup.SerialNoPosted);
            CustomerOrderHeaderPosted.Insert();
            repeat
                CustomerOrderLinePosted.TransferFields(CustomerOrderLine);
                CustomerOrderLinePosted.DocumentNo := CustomerOrderHeaderPosted.No;
                CustomerOrderLinePosted.Insert();
            until CustomerOrderLine.Next() = 0;
        end;
    end;
}