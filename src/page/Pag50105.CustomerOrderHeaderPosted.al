page 50105 CustomerOrderHeaderPosted
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = CustomerOrderHeaderPosted;
    Caption = 'Customer Order Header Posted';
    Editable = false;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(CustomerNo; Rec.CustomerNo)
                {
                    ApplicationArea = All;

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;

                }
                field(VAT; Rec.VAT)
                {
                    ApplicationArea = All;

                }
                field(AmountPaid; AmountPaid)
                {
                    ApplicationArea = All;
                    Caption = 'Amount Paid';
                    trigger OnDrillDown()
                    var
                        CustomerOrderPayment: Record CustomerOrderPayment;
                    begin
                        CustomerOrderPayment.SetFilter(DocumentNo, '%1|%2', Rec.OldDocNo, Rec.No);
                        if not CustomerOrderPayment.IsEmpty then
                            Page.RunModal(Page::CustomerOrderPaymentJournal, CustomerOrderPayment);
                    end;
                }

                field(AmountToPay; Rec.AmountToPay)
                {
                    ApplicationArea = All;

                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;

                }

            }
            part(CustomerOrderLinesPosted; "CustomerOrderLinesPosted")
            {
                SubPageLink = DocumentNo = field(No);
                UpdatePropagation = Both;
            }
        }

    }
    actions
    {
        area(Processing)
        {
            action(Payment)
            {
                ApplicationArea = All;
                Caption = 'Set Payment';
                Image = Payment;
                Enabled = isEnable;
                trigger OnAction()
                var
                    CustomerOrderPayment: record CustomerOrderPayment;
                    TempCustomerOrderPayment: Record CustomerOrderPayment temporary;

                begin
                    TempCustomerOrderPayment.Init();
                    TempCustomerOrderPayment.Validate(CustomerNo, Rec.CustomerNo);
                    TempCustomerOrderPayment.Validate(DocumentNo, Rec.No);
                    TempCustomerOrderPayment.Insert();
                    if Page.RunModal(Page::CustomerOrderPayment, TempCustomerOrderPayment) = Action::LookupOK then begin
                        CustomerOrderPayment.Copy(TempCustomerOrderPayment);
                        CustomerOrderPayment.Insert();
                    end;
                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        CustomerOrderPayment: Record CustomerOrderPayment;
    begin
        CustomerOrderPayment.SetFilter(DocumentNo, '%1|%2', Rec.OldDocNo, Rec.No);
        CustomerOrderPayment.CalcSums(PaymentAmount);
        AmountPaid := CustomerOrderPayment.PaymentAmount;
        isEnable := AmountPaid < Rec.AmountToPay;
    end;

    var
        AmountPaid: Decimal;
        isEnable: Boolean;
}