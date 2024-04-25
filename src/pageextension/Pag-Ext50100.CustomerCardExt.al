pageextension 50100 CustomerCardExt extends "Customer Card"
{
    layout
    {
        movefirst(General; Name, Blocked, "Credit Limit (LCY)")

        modify(Name)
        {
            Caption = 'Name New';
        }
        modify(Blocked)
        {
            Caption = 'Blocked New';
        }
        modify("Credit Limit (LCY)")
        {
            Caption = 'Credit Limit (LCY) New';
        }
        addafter("No.")
        {
            field(NoOfOrders; Rec.NoOfOrders)
            {
                ApplicationArea = All;
                Caption = 'No. Of Orders';
                Editable = false;
            }
            field(PaidAmount; Rec.PaidAmount)
            {
                ApplicationArea = All;
                Caption = 'Paid Amounts';
                Editable = false;
            }
        }
    }

}