pageextension 50101 CustomerListExt extends "Customer List"
{
    layout
    {
        movefirst(Control1; Name, Blocked, "Credit Limit (LCY)")

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
    }

}