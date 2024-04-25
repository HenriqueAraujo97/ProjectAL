page 50105 CustomerOrderHeaderPosted
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
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
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = All;

                }
                field(AmountPaid; Rec.AmountPaid)
                {
                    ApplicationArea = All;
                    Caption = 'Amount Paid';

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
}