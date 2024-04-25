page 50108 CustomerOrderPaymentJournal
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = CustomerOrderPayment;
    Caption = 'Customer Order Payment Journal';
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
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