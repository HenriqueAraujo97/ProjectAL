page 50109 CustomerOrderPayment
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = CustomerOrderPayment;
    Caption = 'Customer Order Payment';
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(DocumentNo; Rec.DocumentNo)
                {
                    ApplicationArea = All;

                }
                field(CustomerNo; Rec.CustomerNo)
                {
                    ApplicationArea = All;

                }
                field(CustomerName; Rec.CustomerName)
                {
                    ApplicationArea = All;

                }
                field(TypeOfPayment; Rec.TypeOfPayment)
                {
                    ApplicationArea = All;

                }
                field(PaymentAmount; Rec.PaymentAmount)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        CustomerOrderPayment: Record CustomerOrderPayment;
                        CustomerOrderHeader: Record CustomerOrderHeader;
                        CustomerOrderHeaderPosted: Record CustomerOrderHeaderPosted;
                    begin
                        if not CustomerOrderHeader.Get(Rec.DocumentNo) then begin
                            CustomerOrderHeaderPosted.Get(Rec.DocumentNo);
                            CustomerOrderPayment.SetFilter(DocumentNo, '%1|%2', CustomerOrderHeaderPosted.OldDocNo, CustomerOrderHeaderPosted.No);
                            CustomerOrderPayment.CalcSums(PaymentAmount);
                            if CustomerOrderHeaderPosted.AmountToPay < CustomerOrderPayment.PaymentAmount + Rec.PaymentAmount then
                                Error('Max Value is: %1', CustomerOrderHeaderPosted.AmountToPay - CustomerOrderPayment.PaymentAmount);
                        end
                        else begin
                            CustomerOrderPayment.SetRange(DocumentNo, Rec.DocumentNo);
                            CustomerOrderPayment.CalcSums(PaymentAmount);
                            CustomerOrderHeader.CalcFields(OrderAmountValue);
                            if CustomerOrderHeader.OrderAmountValue < CustomerOrderPayment.PaymentAmount + Rec.PaymentAmount then
                                Error('Max Value is: %1', CustomerOrderHeader.OrderAmountValue - CustomerOrderPayment.PaymentAmount);
                        end;
                    end;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;

                }
                field(PrepaymentDueDate; Rec.PrepaymentDueDate)
                {
                    ApplicationArea = All;

                }
            }
        }
    }
}